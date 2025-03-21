import 'package:flutter/material.dart';
import 'package:shop_app_clean/core/services/services_locator.dart';
import 'package:shop_app_clean/core/styles/theme_data.dart';
import 'package:shop_app_clean/features/login/presentation/pages/login_page.dart';

void main() {
  ServicesLocator().setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop App',
      theme: Themes.mainTheme,
      home: const LoginPage(),
    );
  }
}
