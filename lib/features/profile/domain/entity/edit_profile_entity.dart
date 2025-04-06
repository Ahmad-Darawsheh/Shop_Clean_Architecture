class EditProfileEntity {
  final String name;
  final String email;
  final String phone;
  final String image;

  EditProfileEntity({
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
  });

  @override
  String toString() {
    return 'EditProfileEntity(name: $name, email: $email, phone: $phone, image: $image)';
  }
}
