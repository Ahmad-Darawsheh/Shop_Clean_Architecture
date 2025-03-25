import 'package:shop_app_clean/features/authenticate/domain/entites/register_entity/register_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel(
      {required super.email,
      required super.id,
      required super.name,
      required super.phone,
      required super.image,
      required super.token});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      email: json['email'] ?? 'No email',
      id: json['id'] ?? 'No id',
      name: json['name'] ?? 'No name',
      phone: json['phone'] ?? 'No phone',
      image: json['image'] ?? 'No image',
      token: json['token'] ?? 'No token',
    );
  }

  RegisterEntity toEntity() {
    return RegisterEntity(
      email: email,
      id: id,
      name: name,
      phone: phone,
      image: image,
      token: token,
    );
  }
}
