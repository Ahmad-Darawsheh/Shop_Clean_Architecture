part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

final class RegisterUserEvent extends RegisterEvent {
  final String email;
  final String password;
  final String name;
  final String phone;

  const RegisterUserEvent(
      {required this.email,
      required this.password,
      required this.name,
      required this.phone});

  @override
  List<Object> get props => [email, password, name, phone];
}
