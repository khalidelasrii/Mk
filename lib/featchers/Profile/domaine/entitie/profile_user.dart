import 'package:equatable/equatable.dart';

class ProfileUser extends Equatable {
  final String uid;
  final String email;
  final String? password;
  final String? profileUrl;
  final String name;
  final String? phoneNumber;
  final String? adress;
  final String? payes;

  const ProfileUser(
      {required this.email,
      required this.name,
      this.adress,
      this.password,
      this.payes,
      this.phoneNumber,
      this.profileUrl,
      required this.uid});

  @override
  List<Object?> get props =>
      [email, name, uid, profileUrl, phoneNumber, payes, password, adress];
}
