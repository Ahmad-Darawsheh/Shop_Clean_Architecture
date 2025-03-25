import 'package:flutter/material.dart';
import 'package:shop_app_clean/core/routes/route_names.dart';
import 'package:shop_app_clean/core/services/navigation_service.dart';
import 'package:shop_app_clean/core/services/services_locator.dart';

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
            sl<NavigationService>().navigateTo(RouteNames.REGISTER);
          },
          child: const Text('Sign Up'),
        ),
      ],
    );
  }
}
