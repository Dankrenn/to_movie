import 'package:flutter/material.dart';
import 'package:to_movie/global_setting_app/theme/app_theme.dart';
import 'package:to_movie/services/hive_service.dart';

class ThemeProvider extends ChangeNotifier{
  HiveService hiveService = HiveService();
  late bool _isAngl = false;
  late bool _isDarkMode = false;

  ThemeProvider() {
    _loadTheme();
  }

  bool get isDarkMode => _isDarkMode;
  bool get isAngl => _isAngl;

  Future<void> _loadTheme() async {
    hiveService.setIsDaskMode(true);
    _isDarkMode = await hiveService.getIsDaskMode();
    notifyListeners();
  }

  Future<void> updateTheme() async {
    _isDarkMode = !_isDarkMode;
    await hiveService.setIsDaskMode(_isDarkMode);
    notifyListeners();
  }

  Future<void> updateAngl() async {
    _isAngl = !_isAngl;
    notifyListeners();
  }

  ThemeData get theme => _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
}