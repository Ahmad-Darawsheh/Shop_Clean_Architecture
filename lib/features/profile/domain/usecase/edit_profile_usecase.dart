import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/error/failures.dart';
import 'package:shop_app_clean/features/profile/domain/entity/edit_profile_entity.dart';
import 'package:shop_app_clean/features/profile/domain/repository/edit_profile_base_repository.dart';

class EditProfileUseCase {
  EditProfileBaseRepository editProfileBaseRepository;
  EditProfileUseCase(this.editProfileBaseRepository);

  Future<Either<Failure, EditProfileEntity>> editProfile(
      String name, String email, String phone, String image) async {
    return await editProfileBaseRepository.updateProfile(
        name, email, phone, image);
  }
}
