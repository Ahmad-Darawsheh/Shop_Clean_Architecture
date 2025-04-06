import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/error/failures.dart';
import 'package:shop_app_clean/features/profile/data/data_source/edit_profile_remote_data_source.dart';
import 'package:shop_app_clean/features/profile/domain/entity/edit_profile_entity.dart';
import 'package:shop_app_clean/features/profile/domain/repository/edit_profile_base_repository.dart';

class EditProfileImplRepository extends EditProfileBaseRepository {
  EditProfileRemoteDataSource editProfileDataSource;
  EditProfileImplRepository(this.editProfileDataSource);

  @override
  Future<Either<Failure, EditProfileEntity>> updateProfile(
      String name, String email, String phone, String image) async {
    try {
      final response =
          await editProfileDataSource.updateProfile(name, email, phone, image);
      return Right(response.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
