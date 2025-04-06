part of 'edit_profile_bloc.dart';

sealed class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object> get props => [];
}

final class EditUserProfileEvent extends EditProfileEvent {
  const EditUserProfileEvent({
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    this.password = "",
  });

  final String name;
  final String email;
  final String phone;
  final String? image;
  final String password;

  @override
  List<Object> get props => [name, email, phone, image!];
}

final class LogoutUserEvent extends EditProfileEvent {}
