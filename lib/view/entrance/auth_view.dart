import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_movie/global_setting_app/navigation/navigation_service.dart';
import 'package:to_movie/view/entrance/entrance_provider.dart';
import 'package:to_movie/view/entrance/help_widgets/my_button.dart';
import 'package:to_movie/view/entrance/help_widgets/my_text_field.dart';
import 'package:to_movie/view/entrance/help_widgets/social_auth_button.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EntranceProvider>(context);
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              // Иконка приветствия
              const _WelcomeHeader(),
              const SizedBox(height: 40),

              // Поля ввода
              const _AuthFormFields(),
              const SizedBox(height: 24),

              // Кнопка входа
              MyButton(
                text: 'Войти',
                onPressed: () {
                  provider.login(context);
                  NavigationService.goToHub(context);
                }
              ),
              const SizedBox(height: 24),

              // Разделитель
              const _OrDivider(),
              const SizedBox(height: 24),

              // Список соц.сетей
              const _SocialAuthButtons(),
              const SizedBox(height: 32),

              // Ссылка на регистрацию
              const _RegisterLink(),
            ],
          ),
        ),
      ),
    );
  }
}

class _WelcomeHeader extends StatelessWidget {
  const _WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Icon(
          Icons.movie_rounded,
          size: 80,
          color: colorScheme.primary,
        ),
        const SizedBox(height: 20),
        Text(
          'С возвращением!',
          style: TextStyle(
            color: colorScheme.onSurface,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Войдите в свой аккаунт',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class _AuthFormFields extends StatelessWidget {
  const _AuthFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EntranceProvider>(context);
    return Column(
      children: [
        MyTextField(
          hintText: 'Электронная почта',
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress, controller: provider.emailController,
        ),
        const SizedBox(height: 16),
        MyTextField(
          hintText: 'Пароль',
          prefixIcon: Icons.lock_outline,
          isPassword: true, controller: provider.passwordController,
          obscureText: provider.obscurePassword,
          onToggleObscureText: provider.togglePasswordVisibility,
        ),
      ],
    );
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey[300],
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'или войдите через',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey[300],
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

class _SocialAuthButtons extends StatelessWidget {
  const _SocialAuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialAuthButton(
          icon: Icons.g_mobiledata,
          onPressed: () {},
        ),
        const SizedBox(width: 20),
        SocialAuthButton(
          icon: Icons.facebook,
          onPressed: () {},
        ),
        const SizedBox(width: 20),
        SocialAuthButton(
          icon: Icons.apple,
          onPressed: () {},
        ),
      ],
    );
  }
}

class _RegisterLink extends StatelessWidget {
  const _RegisterLink({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final provider = Provider.of<EntranceProvider>(context,listen: true);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ещё нет аккаунта? ',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            GestureDetector(
              onTap: () {
                NavigationService.goBack(context);
              },
              child: Text(
                'Зарегистрироваться',
                style: TextStyle(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: () {
              provider.clearAllFields();
              NavigationService.goToUpdatePassword(context);
            },
            child: Text(
              'Забыли пароль?',
              style: TextStyle(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}