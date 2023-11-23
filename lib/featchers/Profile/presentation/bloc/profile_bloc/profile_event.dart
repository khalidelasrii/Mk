part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetMesArticlesEvent extends ProfileEvent {
  final String articletype;
  const GetMesArticlesEvent({required this.articletype});
  @override
  List<Object> get props => [articletype];
}

class GetProfileEvent extends ProfileEvent {
  final ProfileUser profileUser;
  const GetProfileEvent({required this.profileUser});
  @override
  List<Object> get props => [profileUser];
}
