import 'package:flutter/material.dart';
import 'package:shop_app_clean/features/register/presentation/pages/register_page.dart';

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
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const RegisterPage();
            }));
          },
          child: const Text('Sign Up'),
        ),
      ],
    );
  }
}
