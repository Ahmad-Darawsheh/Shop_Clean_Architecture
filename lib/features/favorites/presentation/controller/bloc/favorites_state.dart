part of 'favorites_bloc.dart';

sealed class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

final class FavoritesInitial extends FavoritesState {}

final class GetFavoritesSuccessState extends FavoritesState {
  final List<FavoriteProductEntity> favorites;

  const GetFavoritesSuccessState(this.favorites);

  @override
  List<Object> get props => [favorites];
}

final class GetFavoritesFailureState extends FavoritesState {
  final String message;
  const GetFavoritesFailureState(this.message);
  @override
  List<Object> get props => [message];
}

final class GetFavoritesLoadingState extends FavoritesState {}
