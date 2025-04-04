import 'package:shop_app_clean/core/error/exceptions.dart';
import 'package:shop_app_clean/core/models/error_message_model.dart';
import 'package:shop_app_clean/core/network/api_service.dart';
import 'package:shop_app_clean/features/authenticate/data/datasources/local_storage_data_source.dart';
import 'package:shop_app_clean/features/home/data/models/product_model/home_product/home_product.dart';

class HomeRemoteDataSource {
  final DioClient dio;
  final LocalStorageDataSource localStorageDataSource;

  HomeRemoteDataSource(
      {required this.dio, required this.localStorageDataSource});

  Future<HomeProductModel> getHomeProducts() async {
    final response = await dio.get('home', headers: {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': localStorageDataSource.getToken()
    });
   
    if (response['status'] == false) {
      throw ServerException(ErrorMessageModel.fromJson(response));
    } else {
      return HomeProductModel.fromJson(response['data']);
    }
  }
}
