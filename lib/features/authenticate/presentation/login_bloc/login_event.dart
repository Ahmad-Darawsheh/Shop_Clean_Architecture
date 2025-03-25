part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoginEventStart extends LoginEvent {
  final String email;
  final String password;

  LoginEventStart({required this.email, required this.password});
}
