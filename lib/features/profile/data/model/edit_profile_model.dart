import 'package:shop_app_clean/features/profile/domain/entity/edit_profile_entity.dart';

class EditProfileModel extends EditProfileEntity {
  EditProfileModel(
      {required super.name,
      required super.email,
      required super.phone,
      required super.image,
      });
  factory EditProfileModel.fromJson(Map<String, dynamic> json) {
    return EditProfileModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      
    );
  }

  EditProfileEntity toEntity() {
    return EditProfileEntity(
      name: name,
      email: email,
      phone: phone,
      image: image,
     
    );
  }
}
