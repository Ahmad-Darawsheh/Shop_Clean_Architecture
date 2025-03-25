import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/core/services/services_locator.dart';
import 'package:shop_app_clean/features/authenticate/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:shop_app_clean/features/authenticate/presentation/widgets/register_widgets/register_page_body.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Account'),
          centerTitle: true,
        ),
        body: const SingleChildScrollView(
          child: RegisterPageBody(),
        ),
      ),
    );
  }
}
