import 'package:shop_app_clean/core/network/api_service.dart';
import 'package:shop_app_clean/features/authenticate/data/datasources/local_storage_data_source.dart';
import 'package:shop_app_clean/features/favorites/data/model/favorites_model.dart';

class FavoritesRemoteDataSource {
  DioClient dio;
  LocalStorageDataSource localStorageDataSource;
  FavoritesRemoteDataSource(this.dio, this.localStorageDataSource);

  Future<List<FavoriteProductsModel>> fetchFavorites() async {
    String? token = await localStorageDataSource.getToken();
   final result= await dio.get('favorites', headers: {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': token,
    });
    return (result['data']['data'] as List)
        .map((e) => FavoriteProductsModel.fromJson(e['product']))
        .toList();
  }
}
