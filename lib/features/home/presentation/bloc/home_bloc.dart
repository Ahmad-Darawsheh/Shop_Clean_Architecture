import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_clean/core/routes/route_names.dart';
import 'package:shop_app_clean/core/services/navigation_service.dart';
import 'package:shop_app_clean/core/services/services_locator.dart';
import 'package:shop_app_clean/features/home/domain/usecases/home_products_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCases homeUseCase;
  HomeBloc({required this.homeUseCase}) : super(HomeInitial()) {
    on<BottomNavBarSwitchEvent>(_onBottomNavBarSwitchEvent);

    on<FavoriteItemEvent>(_onFavoriteItemEvent);
  }

  Map<int, bool> favoriteItems = {for (int i = 0; i < 300; i++) i: false};
  NavigationService navigator = sl<NavigationService>();
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favorites',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  int navBarIndex = -1;

  Future<void> _onBottomNavBarSwitchEvent(
      BottomNavBarSwitchEvent event, Emitter<HomeState> emit) async {
    emit(NavBarSwitchLoadingState());
    log("${event.index} $navBarIndex");
    if (event.index == 0 && event.index != navBarIndex) {
      navigator.navigateTo(RouteNames.HOME);
    } else if (event.index == 1 && event.index != navBarIndex) {
      navigator.navigateTo(RouteNames.FAVORITES);
    } else if (event.index == 2 && event.index != navBarIndex) {
      navigator.navigateTo(RouteNames.PROFILE);
    }
    navBarIndex = event.index;
    emit(FavoriteProductSuccessState());
  }

  Future<void> _onFavoriteItemEvent(
      FavoriteItemEvent event, Emitter<HomeState> emit) async {
    favoriteItems[event.id] = !favoriteItems[event.id]!;
    emit(FavoriteProductLoadingState());
    try {
      log(favoriteItems[event.id].toString());

      await homeUseCase.setProductToFavorite(event.id);

      emit(FavoriteProductSuccessState());
    } catch (e) {
      favoriteItems[event.id] = favoriteItems[event.id]!;
      emit(FavoriteProductFailureState(e.toString()));
    }
  }
}
