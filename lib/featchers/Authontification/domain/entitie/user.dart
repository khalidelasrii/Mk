import 'package:equatable/equatable.dart';

class Usr extends Equatable {
  final String? uid;
  final String email;
  final String password;
  final String? profile;
  final String? name;
  final String? phoneNumber;
  final String adress;
  final String payes;

  const Usr(
      {required this.adress,
      required this.payes,
      this.phoneNumber,
      required this.email,
      required this.password,
      this.profile,
      this.name,
      this.uid});

  @override
  List<Object?> get props =>
      [email, password, profile, name, uid, adress, payes, uid];
}
