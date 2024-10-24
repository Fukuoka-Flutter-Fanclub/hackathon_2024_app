class EnvConstants {
  static String supabaseUrl = '';
  static String supabaseAnonKey = '';

  static void load(Map<String, String> env) {
    supabaseUrl = env['SUPABASE_URL'] ?? '';
    supabaseAnonKey = env['SUPABASE_ANON_KEY'] ?? '';
  }
}
