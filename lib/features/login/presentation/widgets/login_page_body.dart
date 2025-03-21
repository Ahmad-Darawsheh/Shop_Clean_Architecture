import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/features/login/presentation/bloc/login_bloc.dart';
import 'package:shop_app_clean/features/login/presentation/widgets/custom_text_form_field.dart';
import 'package:shop_app_clean/features/login/presentation/widgets/forget_password_text.dart';
import 'package:shop_app_clean/features/login/presentation/widgets/login_button.dart';
import 'package:shop_app_clean/features/login/presentation/widgets/no_account.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<LoginBloc>();
    
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) => current is LoginError,
      listener: (context, state) {
        if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Theme.of(context).colorScheme.error,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(10),
              duration: const Duration(seconds: 3),
              action: SnackBarAction(
                label: 'Dismiss',
                textColor: Theme.of(context).colorScheme.onError,
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
            ),
          );
        }
      },
      child: Padding(
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
              controller: bloc.emailController,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              text: 'Password',
              icon: Icons.password,
              keyboardType: TextInputType.visiblePassword,
              isPassword: true,
              controller: bloc.passwordController,
            ),
            const SizedBox(height: 10),
            ForgetPasswordClickableText(),
            const SizedBox(height: 20),
            LoginButton(bloc: bloc),
            const SizedBox(height: 20),
            NoAccountRedirectRegister(),
          ],
        ),
      ),
    );
  }
}