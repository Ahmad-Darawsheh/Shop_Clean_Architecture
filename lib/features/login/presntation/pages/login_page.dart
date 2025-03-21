import 'package:flutter/material.dart';
import 'package:shop_app_clean/features/login/presntation/widgets/custom_text_form_field.dart';
import 'package:shop_app_clean/features/login/presntation/widgets/forget_password_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            CustomTextFormField(
              text: 'Email',
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              isPassword: false,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              text: 'Password',
              icon: Icons.password,
              keyboardType: TextInputType.visiblePassword,
              isPassword: true,
            ),
            const SizedBox(height: 10),
            ForgetPasswordClickableText(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Handle login logic
              },
              
              style: ElevatedButton.styleFrom(
                
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            Row(
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
            ),
          ],
        ),
      ),
    );
  }
}


