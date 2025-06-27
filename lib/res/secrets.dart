import 'package:flutter_dotenv/flutter_dotenv.dart';

class Secrets {
  static final supabaseUrl = dotenv.env['SUPABASE_URL']!;
  static final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY']!;
}
