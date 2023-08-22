part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class AwaitAuthState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;

  const AuthErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class SingInState extends AuthState {
  final Map usr;

  const SingInState({required this.usr});
  @override
  List<Object> get props => [usr];
}

class SingUpState extends AuthState {
  final Map usr;

  const SingUpState({required this.usr});
  @override
  List<Object> get props => [usr];
}
