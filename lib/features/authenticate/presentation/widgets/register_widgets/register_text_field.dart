import 'package:flutter/material.dart';

Widget buildTextFormField({
  required TextEditingController controller,
  required String label,
  required IconData icon,
  TextInputType keyboardType = TextInputType.text,
  required String? validator,
  bool isPassword = false,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: const OutlineInputBorder(),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    ),
    obscureText: isPassword,
    keyboardType: keyboardType,
    validator: (value) {
      return validator;
    },
  );
}
