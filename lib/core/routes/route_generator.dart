import 'package:flutter/material.dart';
import 'package:shop_app_clean/core/routes/route_names.dart';
import 'package:shop_app_clean/features/home/presentation/pages/home_page.dart';
import 'package:shop_app_clean/features/authenticate/presentation/pages/login_page/login_page.dart';
import 'package:shop_app_clean/features/authenticate/presentation/pages/register_page/register_page.dart';
// import other pages

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final args = settings.arguments;

    switch (settings.name) {
      case RouteNames.HOME:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case RouteNames.LOGIN:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case RouteNames.REGISTER:
        return MaterialPageRoute(builder: (_) => const RegisterPage());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Route not found')),
      ),
    );
  }
}
