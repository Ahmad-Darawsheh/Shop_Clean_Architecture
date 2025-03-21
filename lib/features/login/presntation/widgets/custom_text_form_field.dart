import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.text,
    required this.icon,
    required this.keyboardType,
    required this.isPassword,
  });
  final String text;
  final IconData icon;
  final TextInputType keyboardType;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: text,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(),
      ),
      keyboardType: keyboardType,
      obscureText: isPassword,
    );
  }
}
