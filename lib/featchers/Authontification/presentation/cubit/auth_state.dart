part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class IsSingInState extends AuthState {
  final Usr userId;

  const IsSingInState({required this.userId});

  @override
  List<Object> get props => [userId];
}

class IsSingOutstate extends AuthState {}
