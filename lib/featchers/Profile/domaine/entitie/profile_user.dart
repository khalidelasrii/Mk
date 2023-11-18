import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileUser extends Equatable {
  final User? user;
  final String email;
  final String? name;
  final Type? type;
  final int? number;

  const ProfileUser(
      {this.number, this.type, this.user, required this.email, this.name});

  @override
  List<Object?> get props => [user, email, name, type];
}
