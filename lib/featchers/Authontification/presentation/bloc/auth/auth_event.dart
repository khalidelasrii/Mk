part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SingInEvent extends AuthEvent {
  final String email;
  final String password;

  const SingInEvent({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}

class SingUpEvent extends AuthEvent {
  final String email;
  final String password;

  const SingUpEvent({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}
