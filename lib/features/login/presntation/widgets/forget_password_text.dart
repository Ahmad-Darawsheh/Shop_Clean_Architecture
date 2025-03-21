import 'package:flutter/material.dart';

class ForgetPasswordClickableText extends StatelessWidget {
  const ForgetPasswordClickableText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // TODO: Handle forgot password
        },
        child: const Text('Forgot Password?'),
      ),
    );
  }
}