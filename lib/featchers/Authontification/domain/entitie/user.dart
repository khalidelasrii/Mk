import 'package:equatable/equatable.dart';

class Usr extends Equatable {
  final String? uid;
  final String? email;
  final String? password;
  final String? profile;
  final String? name;
  final String? phoneNumber;

  const Usr(
      {this.phoneNumber,
      this.email,
      this.password,
      this.profile,
      this.name,
      this.uid});

  @override
  List<Object?> get props => [email, password, profile, name, uid];
}
