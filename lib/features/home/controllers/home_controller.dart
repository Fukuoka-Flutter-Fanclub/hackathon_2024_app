import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokyo_hakkason2024_app/core/providers/supabase_provider.dart';
import 'package:tokyo_hakkason2024_app/features/home/model/user_model.dart';

final homeControllerProvider =
    StateNotifierProvider<HomeController, AsyncValue<UserModel?>>((ref) {
  return HomeController(ref);
});

class HomeController extends StateNotifier<AsyncValue<UserModel?>> {
  final Ref ref;

  HomeController(this.ref) : super(const AsyncValue.loading()) {
    _init();
  }

  Future<void> _init() async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) {
        state = const AsyncValue.data(null);
        return;
      }

      // Initial fetch
      final userData =
          await supabase.from('users').select().eq('id', user.id).single();

      state = AsyncValue.data(UserModel.fromJson(userData));

      // Setup stream for real-time updates
      supabase
          .from('users')
          .stream(primaryKey: ['id'])
          .eq('id', user.id)
          .listen((List<Map<String, dynamic>> data) {
            if (data.isNotEmpty) {
              state = AsyncValue.data(UserModel.fromJson(data.first));
            }
          });
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
