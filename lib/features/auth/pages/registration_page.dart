import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tokyo_hakkason2024_app/core/providers/supabase_provider.dart';
import 'package:tokyo_hakkason2024_app/core/widgets/buttons/custom_button.dart';
import 'package:tokyo_hakkason2024_app/features/auth/pages/completion_page.dart';

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

      final AuthResponse response = await supabase.auth.signInAnonymously();

      if (response.user != null) {
        try {
          await supabase.from('users').upsert({
            'id': response.user!.id,
            'nickname': _nameController.text.trim(),
            'created_at': DateTime.now().toIso8601String(),
            'updated_at': DateTime.now().toIso8601String(),
          }).select();

          if (!mounted) return;
          context.go(
            CompletionPage.routeName,
            extra: {
              'userId': response.user!.id,
            },
          );
        } catch (dbError) {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('データベースエラー: ${dbError.toString()}')),
          );
          await supabase.auth.signOut();
          return;
        }
      } else {
        throw Exception('認証は成功しましたが、ユーザー情報が取得できませんでした');
      }
    } on AuthException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('認証エラー: ${e.message}')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('エラーが発生しました: ${e.toString()}')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Focus(
      focusNode: _focusNode,
      child: Stack(
        children: [
          Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ニックネームを入力",
                              style: textTheme.headlineMedium,
                            ),
                            Text(
                              "スヤスヤ教に入信するためにあなたの名前を教えてください。",
                              style: textTheme.labelMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: _nameController,
                          enabled: !_isLoading,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'ニックネームを入力してください';
                            }
                            if (value.length > 20) {
                              return 'ニックネームは20文字以内で入力してください';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'ニックネーム',
                            labelStyle: TextStyle(
                              color: Colors.grey[700],
                            ),
                            hintText: '例）スヤリスト',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                        CustomButton(
                          width: 225,
                          height: 56,
                          type: ButtonType.primary,
                          text: "入信する",
                          textStyle: textTheme.labelLarge,
                          onPressed: _isLoading ? null : _signInAnonymously,
                          isLoading: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (_isLoading)
            Container(
              alignment: Alignment.center,
              color: Colors.black54,
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
