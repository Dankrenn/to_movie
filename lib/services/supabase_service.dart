import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static const String _supabaseUrl = 'https://flxdlmdiyvvjzevyyirx.supabase.co';
  static const String _supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZseGRsbWRpeXZ2anpldnl5aXJ4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDc4NTE3MjcsImV4cCI6MjA2MzQyNzcyN30.vErN0mrNTXovngD2ZeqNOvOLl73gLu9IEarWS0Lr4WM';
  final SupabaseClient client = Supabase.instance.client;

  static Future<void> init() async {
    await Supabase.initialize(
      url: _supabaseUrl,
      anonKey: _supabaseKey,
    );
  }
}