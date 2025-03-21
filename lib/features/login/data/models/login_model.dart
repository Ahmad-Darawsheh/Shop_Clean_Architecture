import 'package:shop_app_clean/features/login/domain/entites/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel(
      {required super.email,
      required super.name,
      required super.id,
      required super.phone,
      required super.image,
      required super.points,
      required super.credit,
      required super.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'] ?? "None",
      name: json['name'] ?? "None",
      id: json['id'] ?? 0,
      phone: json['phone'] ?? "Phone Returned Null or no phone",
      image: json['image'] ?? "Image Returned Null",
      points: json['points'] ?? 0.0,
      credit: json['credit'] ?? 0.0,
      token: json['token'] ?? 'Token Returned Null',
    );
  }

  LoginEntity toEntity() {
    return LoginEntity(
        email: email,
        id: id,
        phone: phone,
        image: image,
        points: points,
        credit: credit,
        token: token,
        name: name);
  }
}
