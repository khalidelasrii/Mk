import 'package:equatable/equatable.dart';

class Usr extends Equatable {
  final String uid;
  final String email;
  final String? password;
  final String? profileUrl;
  final String name;
  final String? phoneNumber;
  final String? adress;
  final String? payes;

  const Usr(
      {this.adress,
      this.payes,
      this.phoneNumber,
      required this.email,
      this.password,
      this.profileUrl,
      required this.name,
      required this.uid});

  @override
  List<Object?> get props =>
      [email, password, profileUrl, name, uid, adress, payes, uid];
}
