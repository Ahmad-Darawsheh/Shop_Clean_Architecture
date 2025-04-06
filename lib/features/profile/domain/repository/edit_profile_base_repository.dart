import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/error/failures.dart';
import 'package:shop_app_clean/features/profile/domain/entity/edit_profile_entity.dart';

abstract class EditProfileBaseRepository {
  Future<Either<Failure, EditProfileEntity>> updateProfile(
    String name,
    String email,
    String phone,
    String image,
  );
}
