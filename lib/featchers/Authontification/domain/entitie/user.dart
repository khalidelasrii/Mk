import 'package:equatable/equatable.dart';

class Usr extends Equatable {
  final String? id;
  final String? email;
  final String? password;
  final String? profile;
  final String? name;

  const Usr({this.email, this.password, this.profile, this.name, this.id});

  @override
  List<Object?> get props => [email, password, profile, name, id];
}
