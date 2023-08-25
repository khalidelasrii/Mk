part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;

  const AuthErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class SingInSuccesState extends AuthState {
  final String isConnect;

  const SingInSuccesState({required this.isConnect});
  @override
  List<Object> get props => [isConnect];
}

class SingInFalseState extends AuthState {
  final String isConnect;

  const SingInFalseState({required this.isConnect});
  @override
  List<Object> get props => [isConnect];
}
