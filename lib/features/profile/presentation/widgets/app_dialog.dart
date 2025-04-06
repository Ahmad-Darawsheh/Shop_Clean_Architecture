import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String content;
  final String positiveButtonText;
  final String? negativeButtonText;
  final VoidCallback onPositivePressed;
  final VoidCallback? onNegativePressed;
  final bool isDestructiveAction;

  const AppDialog({
    super.key,
    required this.title,
    required this.content,
    required this.positiveButtonText,
    this.negativeButtonText,
    required this.onPositivePressed,
    this.onNegativePressed,
    this.isDestructiveAction = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Text(title),
      content: Text(content),
      actions: [
        if (negativeButtonText != null)
          TextButton(
            onPressed: onNegativePressed ?? () => Navigator.pop(context),
            child: Text(negativeButtonText!),
          ),
        TextButton(
          onPressed: onPositivePressed,
          child: Text(
            positiveButtonText,
            style: TextStyle(
              color: isDestructiveAction ? Colors.red : null,
            ),
          ),
        ),
      ],
    );
  }
}