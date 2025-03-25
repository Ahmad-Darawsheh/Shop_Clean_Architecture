import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/core/routes/route_names.dart';
import 'package:shop_app_clean/core/services/navigation_service.dart';
import 'package:shop_app_clean/core/services/services_locator.dart';
import 'package:shop_app_clean/core/validation/validators.dart';
import 'package:shop_app_clean/features/authenticate/presentation/login_bloc/login_bloc.dart';
import 'package:shop_app_clean/features/authenticate/presentation/widgets/login_widgets/custom_text_form_field.dart';
import 'package:shop_app_clean/features/authenticate/presentation/widgets/login_widgets/forget_password_text.dart';
import 'package:shop_app_clean/features/authenticate/presentation/widgets/login_widgets/login_button.dart';
import 'package:shop_app_clean/features/authenticate/presentation/widgets/login_widgets/no_account.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<LoginBloc>();

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          _showErrorSnackBar(context, state.message, false);
        } else if (state is LoginSuccess) {
          _showErrorSnackBar(context, 'Login is successful', true);
          sl<NavigationService>().navigateTo(RouteNames.HOME);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: bloc.formKey,
          autovalidateMode: AutovalidateMode.onUnfocus,
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
                validator: (value) {
                  return emailFieldCheck(value);
                },
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                validator: (value) {
                  return passwordFieldCheck(value);
                },
                text: 'Password',
                icon: Icons.password,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                controller: bloc.passwordController,
              ),
              const SizedBox(height: 10),
              ForgetPasswordClickableText(),
              const SizedBox(height: 20),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return LoginButton(bloc: bloc);
                  }
                },
              ),
              const SizedBox(height: 20),
              NoAccountRedirectRegister(),
            ],
          ),
        ),
      ),
    );
  }
}

void _showErrorSnackBar(BuildContext context, String message, bool status) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: status
          ? Theme.of(context).colorScheme.onPrimary
          : Theme.of(context).colorScheme.error,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: Theme.of(context).colorScheme.onError,
        onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
      ),
    ),
  );
}
