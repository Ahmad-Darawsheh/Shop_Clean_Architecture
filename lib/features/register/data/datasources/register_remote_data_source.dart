import 'package:shop_app_clean/core/error/exceptions.dart';
import 'package:shop_app_clean/core/models/error_message_model.dart';
import 'package:shop_app_clean/core/network/api_service.dart';
import 'package:shop_app_clean/features/register/data/models/register_model.dart';

class RegisterRemoteDataSource {
  final DioClient dio;
  RegisterRemoteDataSource({required this.dio});

  Future<RegisterModel> register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    final response = await dio.post('register', data: {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
    }, headers: {
      'lang': 'en',
      'Content-Type': 'application/json'
    });

      if (response['status'] == false) {
      throw ServerException(ErrorMessageModel.fromJson(response));
    } else {
      return RegisterModel.fromJson(response['data']);
    }
    
  }
}
