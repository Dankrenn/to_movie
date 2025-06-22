import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_movie/global_setting_app/navigation/navigation_service.dart';
import 'package:to_movie/view/entrance/entrance_provider.dart';
import 'package:to_movie/view/entrance/help_widgets/my_button.dart';
import 'package:to_movie/view/entrance/help_widgets/my_text_field.dart';

class UpdatePassView extends StatelessWidget {
  const UpdatePassView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final provider = Provider.of<EntranceProvider>(context);
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              // Заголовок
              const _UpdatePassHeader(),
              const SizedBox(height: 40),

              // Поля ввода
              const _PasswordFields(),
              const SizedBox(height: 24),

              // Кнопка подтверждения
              MyButton(
                text: 'Изменить пароль',
                onPressed: () {
                  NavigationService.goBack(context);
                },
              ),
              const SizedBox(height: 32),

              // Ссылка на вход
              const _BackToLoginLink(),
            ],
          ),
        ),
      ),
    );
  }
}

class _UpdatePassHeader extends StatelessWidget {
  const _UpdatePassHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Icon(
          Icons.lock_reset_rounded,
          size: 80,
          color: colorScheme.primary,
        ),
        const SizedBox(height: 20),
        Text(
          'Смена пароля',
          style: TextStyle(
            color: colorScheme.onSurface,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Введите новый пароль и подтвердите его',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class _PasswordFields extends StatelessWidget {
  const _PasswordFields({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EntranceProvider>(context);
    return  Column(
      children: [
        MyTextField(
          hintText: 'Новый пароль',
          prefixIcon: Icons.lock_outline,
          isPassword: true, controller: provider.passwordController,
          obscureText: provider.obscurePassword,
          onToggleObscureText: provider.togglePasswordVisibility,
        ),
        SizedBox(height: 16),
        MyTextField(
          hintText: 'Повторите новый пароль',
          prefixIcon: Icons.lock_outline,
          isPassword: true, controller: provider.confirmPasswordController,
          obscureText: provider.obscurePassword,
          onToggleObscureText: provider.togglePasswordVisibility,
        ),
      ],
    );
  }
}

class _BackToLoginLink extends StatelessWidget {
  const _BackToLoginLink({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final provider = Provider.of<EntranceProvider>(context,listen: true);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Вспомнили пароль? ',
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        GestureDetector(
          onTap: () {
            provider.clearAllFields();
            NavigationService.goBack(context);
          },
          child: Text(
            'Войти',
            style: TextStyle(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}