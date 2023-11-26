part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

class ProfileLodedState extends ProfileState {
  final ProfileUser profileUser;
  const ProfileLodedState({required this.profileUser});
  @override
  List<Object> get props => [profileUser];
}

class LodidAutreProfileState extends ProfileState {
  final ProfileUser profile;
  final Stream<QuerySnapshot<Map<String, dynamic>>>? articles;
  const LodidAutreProfileState({required this.profile, required this.articles});
  @override
  List<Object> get props => [];
}

class ErrorProfileState extends ProfileState {
  final String message;
  const ErrorProfileState({required this.message});

  @override
  List<Object> get props => [message];
}
