import 'dart:developer';

import 'package:shop_app_clean/core/error/exceptions.dart';
import 'package:shop_app_clean/core/models/error_message_model.dart';
import 'package:shop_app_clean/core/network/api_service.dart';
import 'package:shop_app_clean/features/login/data/models/login_model.dart';

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
    log(response.toString() + "response");
    if (response['status'] == false) {
      final errorMessage =
          response['message'] ?? 'Login failed'; // Use message or default
      throw ServerException(ErrorMessageModel.fromJson(response));
    } else {
      return LoginModel.fromJson(response['data']);
    }
  }
}
