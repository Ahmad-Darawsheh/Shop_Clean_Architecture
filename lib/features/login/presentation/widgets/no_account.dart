import 'package:flutter/material.dart';

class NoAccountRedirectRegister extends StatelessWidget {
  const NoAccountRedirectRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?"),
        TextButton(
          onPressed: () {
            // TODO: Navigate to register page
          },
          child: const Text('Sign Up'),
        ),
      ],
    );
  }
}
