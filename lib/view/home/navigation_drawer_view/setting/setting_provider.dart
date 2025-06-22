import 'package:flutter/material.dart';
import 'package:to_movie/global_setting_app/theme/app_theme.dart';
import 'package:to_movie/services/hive_service.dart';

class SettingProvider extends ChangeNotifier{
  HiveService hiveService = HiveService();
  late bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  SettingProvider() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    _isDarkMode = await hiveService.getIsDaskMode();
    notifyListeners();
  }

  Future<void> updateTheme() async {
    _isDarkMode = !_isDarkMode;
    await hiveService.setIsDaskMode(_isDarkMode);
    notifyListeners();
  }
  ThemeData get theme => _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
}