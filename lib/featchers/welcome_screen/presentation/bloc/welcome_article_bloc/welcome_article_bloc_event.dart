part of 'welcome_article_bloc_bloc.dart';

sealed class WelcomeArticleBlocEvent extends Equatable {
  const WelcomeArticleBlocEvent();

  @override
  List<Object> get props => [];
}

class RecherchStatEvent extends WelcomeArticleBlocEvent {
  final String value;
  const RecherchStatEvent({required this.value});
  @override
  List<Object> get props => [value];
}

class WelcomeBlocInitialEvent extends WelcomeArticleBlocEvent {}

class AdoorArticlesloadingEvent extends WelcomeArticleBlocEvent {}

class GetarticleParCategorieEvent extends WelcomeArticleBlocEvent {
  final String collection;
  const GetarticleParCategorieEvent({required this.collection});
  @override
  List<Object> get props => [collection];
}
