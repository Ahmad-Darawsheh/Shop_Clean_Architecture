import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<BottomNavBarSwitchEvent>(_onBottomNavBarSwitchEvent);
  }

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

  int navBarIndex = 0;

  Future<void> _onBottomNavBarSwitchEvent(
      BottomNavBarSwitchEvent event, Emitter<HomeState> emit) async {
    emit(NavBarSwitchLoadingState());
    navBarIndex = event.index;
    emit(NavBarSwitchSuccessState());
  }
}
