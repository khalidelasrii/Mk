part of 'adoor_articles_cubit.dart';

sealed class AdoorArticlesState extends Equatable {
  const AdoorArticlesState();

  @override
  List<Object> get props => [];
}

final class AdoorArticlesInitial extends AdoorArticlesState {}

class LodingAdoorArticlesState extends AdoorArticlesState {}

class ErrorLodingAdoorArticleState extends AdoorArticlesState {
  final String message;
  const ErrorLodingAdoorArticleState({required this.message});
  @override
  List<Object> get props => [message];
}

class LodidAdorArticlesState extends AdoorArticlesState {
  final List<WelcomeArticle> articles;
  const LodidAdorArticlesState({required this.articles});
  @override
  List<Object> get props => [articles];
}
