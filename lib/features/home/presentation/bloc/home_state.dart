part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class NavBarSwitchSuccessState extends HomeState {}

final class NavBarSwitchLoadingState extends HomeState {}

final class FavoriteProductSuccessState extends HomeState {}

class FavoriteProductLoadingState extends HomeState {}

final class FavoriteProductFailureState extends HomeState {
  final String message;
  const FavoriteProductFailureState(this.message);

  @override
  List<Object> get props => [message];
}
