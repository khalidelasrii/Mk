part of 'article_bloc.dart';

sealed class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

final class ArticleInitial extends ArticleState {}

class LodingArticlesState extends ArticleState {}

class LodedAllarticles extends ArticleState {
  final List<Article> articles;
  const LodedAllarticles({required this.articles});
  @override
  List<Object> get props => [articles];
}

class ErrorArticlesState extends ArticleState {
  final String message;

  const ErrorArticlesState({required this.message});

  @override
  List<Object> get props => [message];
}
