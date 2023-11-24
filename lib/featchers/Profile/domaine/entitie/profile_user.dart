import 'package:equatable/equatable.dart';

class ProfileUser extends Equatable {
  final String? uid;
  final String? email;
  final String? password;
  final String? profile;
  final String? name;
  final String? phoneNumber;
  final String? adress;
  final String? payes;

  final Type? type;
  final int? number;

  const ProfileUser(
      {this.number,
      this.type,
      required this.email,
      this.name,
      this.adress,
      this.password,
      this.payes,
      this.phoneNumber,
      this.profile,
      this.uid});

  @override
  List<Object?> get props =>
      [email, name, type, uid, profile, phoneNumber, payes, password, adress];
}
