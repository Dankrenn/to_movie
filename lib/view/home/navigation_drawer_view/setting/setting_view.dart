import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:to_movie/global_setting_app/theme/app_theme.dart';
import 'package:to_movie/global_setting_app/theme/theme_provider.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            ThemeWidget(),
            UpdateLanguage(),
          ],
        ),
      ),
    );
  }
}

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ThemeProvider>(context);
    final colorScheme =model.theme.colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Ночная тема",
          style: TextStyle(fontSize: 20, color: colorScheme.onSurface),
        ),
        CupertinoSwitch(
          value: model.isDarkMode,
          onChanged: (value) => model.updateTheme(),
          activeColor: AppTheme.successColor,
          trackColor: colorScheme.onPrimary,
        ),
      ],
    );
  }
}

class UpdateLanguage extends StatelessWidget {
  const UpdateLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ThemeProvider>(context);
    final colorScheme = model.theme.colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Английский язык",
          style: TextStyle(fontSize: 20, color: colorScheme.onSurface),
        ),
        CupertinoSwitch(
          value: model.isAngl,
          onChanged: (value) => model.updateAngl(),
          activeColor: AppTheme.successColor,
          trackColor: colorScheme.onPrimary,
        ),
      ],
    );
  }
}

