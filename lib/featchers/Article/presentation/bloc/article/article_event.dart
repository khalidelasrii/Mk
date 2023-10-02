part of 'article_bloc.dart';

sealed class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class GetAllArticlesEvent extends ArticleEvent {}

class AddoorlableArticlesEvent extends ArticleEvent {
  final Article article;

  const AddoorlableArticlesEvent(this.article);
  @override
  List<Object> get props => [article];
}
