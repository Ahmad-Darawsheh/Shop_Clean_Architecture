import 'package:flutter/material.dart';
import 'package:shop_app_clean/features/register/presentation/widgets/register_page_body.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: RegisterPageBody(),
      ),
    );
  }
}