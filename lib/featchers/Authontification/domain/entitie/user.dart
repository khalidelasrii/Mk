import 'package:equatable/equatable.dart';

class Usr extends Equatable {
  final String id;
  final String email;
  final String password;
  final String? profile;
  final String? name;

  const Usr(
      {required this.email,
      required this.password,
      this.profile,
      this.name,
      required this.id});

  @override
  List<Object?> get props => throw UnimplementedError();
}
