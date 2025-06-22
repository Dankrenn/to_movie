import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool? obscureText;
  final VoidCallback? onToggleObscureText;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.obscureText,
    this.onToggleObscureText,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return TextField(
      controller: controller,
      obscureText: isPassword ? (obscureText ?? true) : false,
      keyboardType: keyboardType,
      style: TextStyle(color: colorScheme.onSurface),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: isDark ? Colors.grey[600] : Colors.grey[500],
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: isDark ? Colors.grey[600] : Colors.grey[500],
        ),
        filled: true,
        fillColor: isDark
            ? Colors.grey[900]!.withOpacity(0.7)
            : Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            obscureText ?? true
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: isDark ? Colors.grey[600] : Colors.grey[500],
          ),
          onPressed: onToggleObscureText,
        )
            : null,
      ),
    );
  }
}