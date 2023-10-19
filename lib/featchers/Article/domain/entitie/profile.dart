import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String email;
  final String? name;
  final String id;
  final String? profile;
  final String numberPhone;
  final String payes;
  final String? adress;
  final String? message;

  const Profile(
      {required this.email,
      this.name,
      this.message,
      required this.id,
      this.profile,
      required this.numberPhone,
      required this.payes,
      this.adress});

  @override
  List<Object?> get props =>
      [email, name, id, profile, numberPhone, payes, adress, message];
}
