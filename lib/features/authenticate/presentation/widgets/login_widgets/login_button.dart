import 'package:flutter/material.dart';
import 'package:shop_app_clean/features/authenticate/presentation/bloc/login_bloc/login_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.bloc,
  });

  final LoginBloc bloc;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (bloc.formKey.currentState!.validate()) {
          bloc.add(LoginEventStart(
              email: bloc.emailController.text,
              password: bloc.passwordController.text));
        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      child: const Text(
        'Login',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
