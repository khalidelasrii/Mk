part of 'article_bloc.dart';

sealed class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

final class ArticleInitial extends ArticleState {}

class LodedAllarticlesState extends ArticleState {
  final Stream<QuerySnapshot<Map>> articles;
  const LodedAllarticlesState({required this.articles});
  @override
  List<Object> get props => [articles];
}

class ErrorArticlesState extends ArticleState {
  final String message;

  const ErrorArticlesState({required this.message});

  @override
  List<Object> get props => [message];
}
