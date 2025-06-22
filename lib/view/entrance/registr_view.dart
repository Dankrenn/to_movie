import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_movie/global_setting_app/navigation/navigation_service.dart';
import 'package:to_movie/view/entrance/entrance_provider.dart';
import 'package:to_movie/view/entrance/help_widgets/my_button.dart';
import 'package:to_movie/view/entrance/help_widgets/my_text_field.dart';
import 'package:to_movie/view/entrance/help_widgets/social_auth_button.dart';

class RegistrView extends StatelessWidget {
  const RegistrView({super.key});

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
              //Иконка приветствия
              const _WelcomeHeader(),
              const SizedBox(height: 40),

              //Список полей
              const _ListTextField(),
              const SizedBox(height: 24),

              // Кнопка регистрации
              MyButton(text: 'Зарегистрироваться', onPressed: () {
                provider.register(context);
                NavigationService.goToAuth(context);
              }),
              const SizedBox(height: 24),

              // Разделитель
              const _OrDivider(),
              const SizedBox(height: 24),
              // Список соц.сетей
              const _ListSocialAuth(),
              const SizedBox(height: 32),

              // Ссылка на вход
              const _LoginLink(),
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
          'Создайте аккаунт',
          style: TextStyle(
            color: colorScheme.onSurface,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Начните персонализированный просмотр',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class _ListTextField extends StatelessWidget {
  const _ListTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EntranceProvider>(context);
    return Column(children: [
      MyTextField(
        hintText: 'Имя пользователя',
        prefixIcon: Icons.person_outline, controller: provider.usernameController,
      ),
      const SizedBox(height: 16),
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
      const SizedBox(height: 16),
      MyTextField(
        hintText: 'Подтвердите пароль',
        prefixIcon: Icons.lock_outline,
        isPassword: true, controller: provider.confirmPasswordController,
        obscureText: provider.obscurePassword,
        onToggleObscureText: provider.togglePasswordVisibility,
      ),
    ]);
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

class _ListSocialAuth extends StatelessWidget {
  const _ListSocialAuth({super.key});

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

class _LoginLink extends StatelessWidget {
  const _LoginLink({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final provider = Provider.of<EntranceProvider>(context,listen: true);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Уже есть аккаунт? ',
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        GestureDetector(
          onTap: () {
            provider.clearAllFields();
            NavigationService.goToAuth(context);
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
