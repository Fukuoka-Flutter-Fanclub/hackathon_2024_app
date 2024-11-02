import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConstants {
  String supabaseUrl = '';
  String supabaseAnonKey = '';
  String sentryUrl = '';
  String chatGptApiKey = '';

  // シングルトンインスタンス
  static final EnvConstants _instance = EnvConstants._internal();

  // プライベートなコンストラクタ
  EnvConstants._internal();

  // インスタンスを取得するメソッド
  factory EnvConstants() {
    return _instance;
  }

  // SharedPreferencesの初期化
  Future<void> init() async {
    await dotenv.load(fileName: '.env');
    final env = dotenv.env;
    supabaseUrl = env['SUPABASE_URL'] ?? '';
    supabaseAnonKey = env['SUPABASE_ANON_KEY'] ?? '';
    sentryUrl = env['SENTRY_URL'] ?? '';
    chatGptApiKey = env['CHAT_GPT_API_KEY'] ?? '';
  }
}
