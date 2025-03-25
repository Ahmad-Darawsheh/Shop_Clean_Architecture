import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/core/routes/route_names.dart';
import 'package:shop_app_clean/core/services/navigation_service.dart';
import 'package:shop_app_clean/core/services/services_locator.dart';
import 'package:shop_app_clean/core/validation/validators.dart';
import 'package:shop_app_clean/features/authenticate/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:shop_app_clean/features/authenticate/presentation/widgets/register_widgets/register_button.dart';
import 'package:shop_app_clean/features/authenticate/presentation/widgets/register_widgets/register_text_field.dart';

class RegisterPageBody extends StatelessWidget {
  const RegisterPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<RegisterBloc>();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Join Us Today',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            'Create an account to start shopping',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),

          // Name field
          buildTextFormField(
            controller: bloc.nameController,
            label: 'Full Name',
            icon: Icons.person,
            keyboardType: TextInputType.name,
            validator: nameFieldCheck(bloc.nameController.text),
          ),
          const SizedBox(height: 20),

          // Email field
          buildTextFormField(
            controller: bloc.emailController,
            label: 'Email',
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            validator: emailFieldCheck(bloc.emailController.text),
          ),
          const SizedBox(height: 20),

          // Phone field
          buildTextFormField(
            controller: bloc.phoneController,
            label: 'Phone Number',
            icon: Icons.phone,
            keyboardType: TextInputType.phone,
            validator: phoneNumberFieldCheck(bloc.phoneController.text),
          ),
          const SizedBox(height: 20),

          // Password field
          buildTextFormField(
            controller: bloc.passwordController,
            label: 'Password',
            icon: Icons.lock,
            isPassword: true,
            validator: passwordFieldCheck(bloc.passwordController.text),
          ),
          const SizedBox(height: 30),

          RegisterButton(bloc: bloc),
          const SizedBox(height: 20),

          // Login link
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              TextButton(
                onPressed: () {
                  sl<NavigationService>()
                      .navigateToAndRemoveUntil(RouteNames.LOGIN);
                },
                child: const Text('Log In'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
