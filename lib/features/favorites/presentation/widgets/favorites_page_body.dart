import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/features/favorites/presentation/controller/bloc/favorites_bloc.dart';
import 'package:shop_app_clean/features/favorites/presentation/widgets/empty_favorites_view.dart';
import 'package:shop_app_clean/features/favorites/presentation/widgets/error_view.dart';
import 'package:shop_app_clean/features/favorites/presentation/widgets/favorites_list.dart';
import 'package:shop_app_clean/features/home/presentation/bloc/home_bloc.dart';
import 'package:shop_app_clean/features/home/presentation/widgets/shared_home_widgets/bottom_nav_bar.dart';

class FavoritesPageBody extends StatefulWidget {
  const FavoritesPageBody({super.key});

  @override
  State<FavoritesPageBody> createState() => _FavoritesPageBodyState();
}

class _FavoritesPageBodyState extends State<FavoritesPageBody> {
  @override
  void initState() {
    super.initState();
    // Load favorites when page is first opened
    context.read<FavoritesBloc>().add(GetFavoritesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        title: const Text('My Favorites'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<FavoritesBloc>().add(GetFavoritesEvent());
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBarHome(
        bloc: context.read<HomeBloc>(),
      ),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          if (state is GetFavoritesLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetFavoritesSuccessState) {
            if (state.favorites.isEmpty||state.favorites==[]||state.favorites.firstOrNull==null) {
              return const EmptyFavoritesView();
            }
            return FavoritesList(favorites: state.favorites);
          } else if (state is GetFavoritesFailureState) {
            return ErrorView(
              message: state.message,
              onRetry: () =>
                  context.read<FavoritesBloc>().add(GetFavoritesEvent()),
            );
          }
          // Initial state
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
