import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/features/home/presentation/bloc/home_bloc.dart';

class BottomNavBarHome extends StatelessWidget {
  const BottomNavBarHome({
    super.key,
    required this.bloc,
  });

  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return BottomNavigationBar(
          onTap: (value) {
            bloc.add(BottomNavBarSwitchEvent(value));
          },
          currentIndex: bloc.navBarIndex == -1 ? 0 : bloc.navBarIndex,
          items: bloc.items,
        );
      },
    );
  }
}
