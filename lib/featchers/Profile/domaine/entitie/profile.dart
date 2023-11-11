import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileUser extends Equatable {
  final User? user;
  final String email;
  final String name;

  ProfileUser(this.user, this.email, this.name);

  @override
  List<Object?> get props => [];
}
