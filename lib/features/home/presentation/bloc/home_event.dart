part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class BottomNavBarSwitchEvent extends HomeEvent {
  final int index;

  const BottomNavBarSwitchEvent(this.index);

  @override
  List<Object> get props => [index];
}

final class FavoriteItemEvent extends HomeEvent {
  final int id;
   
   const FavoriteItemEvent(this.id);

  @override
  List<Object> get props => [id];
}
