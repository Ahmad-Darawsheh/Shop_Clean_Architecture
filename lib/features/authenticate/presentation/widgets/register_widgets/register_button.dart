import 'package:flutter/material.dart';
import 'package:shop_app_clean/features/authenticate/presentation/bloc/register_bloc/register_bloc.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.bloc,
  });

  final RegisterBloc bloc;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        bloc.add(RegisterUserEvent(
          name: bloc.nameController.text,
          email: bloc.emailController.text,
          phone: bloc.phoneController.text,
          password: bloc.passwordController.text,
        ));
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      child: const Text(
        'Create Account',
        style: TextStyle(fontSize: 16),
      ),
    );
  }}