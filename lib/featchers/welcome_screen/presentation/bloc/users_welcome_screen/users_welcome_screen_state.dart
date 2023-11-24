part of 'users_welcome_screen_cubit.dart';

sealed class UsersWelcomeScreenState extends Equatable {
  const UsersWelcomeScreenState();

  @override
  List<Object> get props => [];
}

final class UsersWelcomeScreenInitial extends UsersWelcomeScreenState {}

class LodidUsersWelcomeState extends UsersWelcomeScreenState {
  final List<ProfileUser> profiles;
  const LodidUsersWelcomeState({required this.profiles});

  @override
  List<Object> get props => [profiles];
}
