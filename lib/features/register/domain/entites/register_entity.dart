import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final String email;
  final String id;
  final String name;
  final String phone;
  final String image;
  final String token;

  const RegisterEntity(
      {required this.email,
      required this.id,
      required this.name,
      required this.phone,
      required this.image,
      required this.token});

  @override
  List<Object?> get props => [email, id, name, phone, image, token];
}
