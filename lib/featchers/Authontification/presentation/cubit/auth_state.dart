part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class IsSingInState extends AuthState {
  final String message;

  const IsSingInState({required this.message});
}

class IsSingOutstate extends AuthState {
  final String message;

  const IsSingOutstate({required this.message});
  @override
  List<Object> get props => [message];
}

class ErrorSingState extends AuthState {
  final String message;

  const ErrorSingState({required this.message});
  @override
  List<Object> get props => [message];
}

class LodingAuthState extends AuthState {}
