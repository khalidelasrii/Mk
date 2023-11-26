part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetMesArticlesEvent extends ProfileEvent {
  final ProfleArticle profleArticle;
  const GetMesArticlesEvent({required this.profleArticle});
  @override
  List<Object> get props => [profleArticle];
}

class GetProfileEvent extends ProfileEvent {
  final ProfleArticle user;
  const GetProfileEvent({required this.user});
  @override
  List<Object> get props => [user];
}
