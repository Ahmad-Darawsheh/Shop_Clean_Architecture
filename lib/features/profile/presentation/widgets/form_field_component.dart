import 'package:flutter/material.dart';

class FormFieldWithLabel extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData? icon;
  final bool enabled;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const FormFieldWithLabel({
    super.key,
    required this.label,
    required this.controller,
    this.icon,
    this.enabled = true,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          enabled: enabled,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.grey[300]!,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.grey[300]!,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            prefixIcon: icon != null ? Icon(icon) : null,
            filled: !enabled,
            fillColor: enabled ? null : Colors.grey[100],
          ),
        ),
      ],
    );
  }
}