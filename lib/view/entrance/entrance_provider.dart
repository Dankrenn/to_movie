import 'package:flutter/material.dart';


class EntranceProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }



  Future<void> register(BuildContext context) async {

  }

  Future<void> login(BuildContext context) async {

  }

  Future<void> updatePassword(BuildContext context) async {

  }

  Future<void> logout() async {
  }

  void clearAllFields() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    usernameController.clear();
    _obscurePassword = true;
    notifyListeners();
  }
}