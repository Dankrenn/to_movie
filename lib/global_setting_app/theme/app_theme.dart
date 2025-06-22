import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: const Color(0xFFE50914),       // Основной красный
      primaryContainer: const Color(0xFFB81D24), // Темный красный
      secondary: const Color(0xFF00B4D8),     // Акцентный голубой
      secondaryContainer: const Color(0xFF0088A7), // Темный голубой
      surface: const Color(0xFFFFFFFF),       // Фон поверхностей
      error: const Color(0xFFB00020),         // Ошибка
      onPrimary: const Color(0xFFFFFFFF),     // Текст на primary
      onSecondary: const Color(0xFF000000),   // Текст на secondary
      onSurface: const Color(0xFF333333),     // Основной текст
      onError: const Color(0xFFFFFFFF),       // Текст на error
      brightness: Brightness.light,
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: const Color(0xFFE50914),       // Основной красный
      primaryContainer: const Color(0xFFB81D24), // Темный красный
      secondary: const Color(0xFF00B4D8),     // Акцентный голубой
      secondaryContainer: const Color(0xFF0088A7), // Темный голубой
      surface: const Color(0xFF121212),       // Фон поверхностей
      error: const Color(0xFFCF6679),         // Ошибка
      onPrimary: const Color(0xFFFFFFFF),     // Текст на primary
      onSecondary: const Color(0xFF000000),   // Текст на secondary
      onSurface: const Color(0xFFFFFFFF),     // Основной текст
      onError: const Color(0xFF000000),       // Текст на error
      brightness: Brightness.dark,
    ),
  );

  // Дополнительные цвета
  static const Color ratingColor = Color(0xFFFFC107);  // Золотой для рейтинга
  static const Color successColor = Color(0xFF4CAF50); // Зеленый успеха
  static const Color warningColor = Color(0xFFFF9800); // Оранжевый предупреждения
  static const Color infoColor = Color(0xFF2196F3);    // Синий информация
}