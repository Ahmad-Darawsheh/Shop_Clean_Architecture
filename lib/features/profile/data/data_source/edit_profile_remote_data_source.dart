import 'package:shop_app_clean/core/error/exceptions.dart';
import 'package:shop_app_clean/core/models/error_message_model.dart';
import 'package:shop_app_clean/core/network/api_service.dart';
import 'package:shop_app_clean/features/authenticate/data/datasources/local_storage_data_source.dart';
import 'package:shop_app_clean/features/profile/data/model/edit_profile_model.dart';

class EditProfileRemoteDataSource {
  DioClient dio;
  LocalStorageDataSource localStorageDataSource;
  EditProfileRemoteDataSource(
      {required this.dio, required this.localStorageDataSource});

  Future<EditProfileModel> updateProfile(
      String name, String email, String phone, String image,
      [String? password]) async {
    final Map<String, dynamic> requestData = {
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
    };

    if (password != null && password.isNotEmpty) {
      requestData['password'] = password;
    }

    final response =
        await dio.put('update-profile', data: requestData, headers: {
      'lang': 'en',
      'Content-Type': 'application/json  ',
      'Authorization': localStorageDataSource.getToken(),
    });

    if (response.statusCode == 200) {
      return EditProfileModel.fromJson(response['data']);
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }
}
