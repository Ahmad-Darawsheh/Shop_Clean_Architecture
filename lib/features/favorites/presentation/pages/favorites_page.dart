import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/core/services/services_locator.dart';
import 'package:shop_app_clean/features/favorites/presentation/controller/bloc/favorites_bloc.dart';
import 'package:shop_app_clean/features/favorites/presentation/widgets/favorites_page_body.dart';
import 'package:shop_app_clean/features/home/presentation/bloc/home_bloc.dart';


class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<FavoritesBloc>(
        create: (context) => sl<FavoritesBloc>()..add(GetFavoritesEvent()),
      ),
      BlocProvider(
        create: (context) => sl<HomeBloc>(),
      ),
    ], child: FavoritesPageBody());
  }
}
