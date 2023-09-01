part of 'article_bloc.dart';

sealed class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class GetAllArticlesEvent extends ArticleEvent {}

class GetMesArticleEvent extends ArticleEvent {}
