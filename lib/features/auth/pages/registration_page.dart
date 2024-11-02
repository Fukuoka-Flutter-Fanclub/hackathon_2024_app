import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tokyo_hakkason2024_app/features/auth/pages/signup_page.dart';
import 'package:tokyo_hakkason2024_app/features/home/pages/home_page.dart';

import '../../../core/providers/supabase_provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});
  static const String routeName = '/registration';

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _nameController = TextEditingController();
  final _focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _signInAnonymously() async {
    try {
      _focusNode.unfocus();
      final validate = _formKey.currentState?.validate();
      if (validate == false) {
        _focusNode.requestFocus();
        return;
      }
      setState(() => _isLoading = true);

      // 匿名認証を実行
      final AuthResponse response = await supabase.auth.signInAnonymously();

      // usersテーブルにユーザー情報を保存
      if (response.user != null) {
        await supabase.from('users').upsert({
          'id': response.user!.id,
          'name': _nameController.text.trim(),
          'created_at': DateTime.now().toIso8601String(),
          'updated_at': DateTime.now().toIso8601String(),
        });

        // BuildContextの有効性をチェック
        if (!mounted) return;

        // ホーム画面に遷移
        context.go(HomePage.routeName);
      }
    } on AuthException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('予期せぬエラーが発生しました')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: '信者名'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ニックネームを入力してください';
                    }
                    if (value.length > 20) {
                      return 'ニックネームは20文字以内で入力してください';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _isLoading ? null : _signInAnonymously,
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : const Text('匿名でログイン'),
                ),
                if (!_isLoading) ...[
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      _focusNode.unfocus();
                      context.go(SignupPage.routeName);
                    },
                    child: const Text('アカウントを作成して登録'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
