import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/core/services/services_locator.dart';
import 'package:shop_app_clean/features/home/presentation/bloc/home_bloc.dart';
import 'package:shop_app_clean/features/profile/presentation/controller/bloc/edit_profile_bloc.dart';
import 'package:shop_app_clean/features/profile/presentation/widgets/profile_page_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EditProfileBloc>(
          create: (context) => sl<EditProfileBloc>(),
        ),
        BlocProvider(create: (context) => sl<HomeBloc>()),
      ],
      child: const ProfilePageBody(),
    );
  }
}
