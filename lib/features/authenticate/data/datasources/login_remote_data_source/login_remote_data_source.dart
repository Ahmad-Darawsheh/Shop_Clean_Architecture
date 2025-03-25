import 'package:shop_app_clean/core/error/exceptions.dart';
import 'package:shop_app_clean/core/models/error_message_model.dart';
import 'package:shop_app_clean/core/network/api_service.dart';
import 'package:shop_app_clean/features/authenticate/data/models/login_model/login_model.dart';

class LoginRemoteDataSource {
  final DioClient dio;
  LoginRemoteDataSource({required this.dio});

  Future<LoginModel> login(String email, String password) async {
    final response = await dio.post('login', data: {
      'email': email,
      'password': password,
    }, headers: {
      'lang': 'en',
      'Content-Type': 'application/json'
    });

    if (response['status'] == false) {
      throw ServerException(ErrorMessageModel.fromJson(response));
    } else {
      return LoginModel.fromJson(response['data']);
    }
  }
}
