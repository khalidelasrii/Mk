part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

class ProleLodedState extends ProfileState {
  final ProfileUser profileUser;
  const ProleLodedState({required this.profileUser});
  @override
  List<Object> get props => [profileUser];
}

class LodedArticleState extends ProfileState {
  final Stream<QuerySnapshot<Map>> articles;
  const LodedArticleState({required this.articles});
  @override
  List<Object> get props => [articles];
}

class ErrorProfileState extends ProfileState {
  final String message;
  const ErrorProfileState({required this.message});

  @override
  List<Object> get props => [message];
}
