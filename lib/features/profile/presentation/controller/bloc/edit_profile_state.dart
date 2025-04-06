part of 'edit_profile_bloc.dart';

sealed class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object> get props => [];
}

final class EditProfileInitial extends EditProfileState {}

final class EditUserProfileSuccessState extends EditProfileState {
  const EditUserProfileSuccessState({
    required this.editProfileData,
  });

  final EditProfileEntity editProfileData;

  @override
  List<Object> get props => [editProfileData];
}

final class EditUserProfileFailureState extends EditProfileState {
  final String message;
  const EditUserProfileFailureState({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

final class EditUserProfileLoadingState extends EditProfileState {}

final class LogoutUserLoadingState extends EditProfileState {}

final class LogoutUserSuccessState extends EditProfileState {}

final class LogoutUserErrorState extends EditProfileState {}
