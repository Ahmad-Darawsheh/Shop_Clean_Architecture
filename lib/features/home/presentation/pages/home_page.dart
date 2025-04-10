import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/core/services/services_locator.dart';
import 'package:shop_app_clean/features/favorites/presentation/controller/bloc/favorites_bloc.dart';
import 'package:shop_app_clean/features/home/presentation/bloc/home_bloc.dart';
import 'package:shop_app_clean/features/home/presentation/widgets/home_widgets/home_page_body.dart';
import 'package:shop_app_clean/features/home/presentation/widgets/shared_home_widgets/bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
         create: (context) => sl<HomeBloc>(),
        ),
        BlocProvider(
         create: (context) => sl<FavoritesBloc>(),
        )
      ], 
      child: Builder(builder: (context) {
        HomeBloc bloc = context.read<HomeBloc>();
        return Scaffold(
          bottomNavigationBar: BottomNavBarHome(bloc: bloc),
          body: HomePageBody(),
        );
      }),
    );
  }
}
