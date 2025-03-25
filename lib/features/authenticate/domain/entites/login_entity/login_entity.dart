import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String email;
  final String name;
  final int id;
  final String phone;
  final String image;
  final int points;
  final int credit;
  final String token;

  LoginEntity(
      {required this.email,
      required this.name,
      required this.id,
      required this.phone,
      required this.image,
      required this.points,
      required this.credit,
      required this.token});

  @override
  // TODO: implement props
  List<Object?> get props => [email, id, phone, image, points, credit, token];
}
