import 'package:flutter/material.dart';
import 'package:shop_app_clean/core/styles/colors.dart';
import 'package:shop_app_clean/core/styles/theme_data.dart';
import 'package:shop_app_clean/features/login/presntation/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
