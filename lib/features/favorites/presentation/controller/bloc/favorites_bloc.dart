import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_clean/features/favorites/domain/entity/favorite_product_entity.dart';
import 'package:shop_app_clean/features/favorites/domain/uscase/favorites_use_case.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesUseCase favoritesUseCase;
  FavoritesBloc({required this.favoritesUseCase}) : super(FavoritesInitial()) {
    on<GetFavoritesEvent>(_onGetFavoritesEvent);
  }
  Future<void> _onGetFavoritesEvent(
    GetFavoritesEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(GetFavoritesLoadingState());
    final result = await favoritesUseCase.getFavorites();
    result.fold(
      (failure) => emit(GetFavoritesFailureState(failure.message)),
      (favorites) => emit(GetFavoritesSuccessState(favorites)),
    );
  }
}
