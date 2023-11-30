part of 'welcome_article_bloc_bloc.dart';

sealed class WelcomeArticleBlocState extends Equatable {
  const WelcomeArticleBlocState();

  @override
  List<Object> get props => [];
}

final class WelcomeArticleBlocInitial extends WelcomeArticleBlocState {}

class RecherchStartstate extends WelcomeArticleBlocState {
  final Stream<QuerySnapshot<Map<String, dynamic>>> value;

  const RecherchStartstate(this.value);
  @override
  List<Object> get props => [value];
}

class LodidAdorArticlesState extends WelcomeArticleBlocState {
  final List<WelcomeArticle> articles;
  const LodidAdorArticlesState({required this.articles});
  @override
  List<Object> get props => [articles];
}

class ArticleParCategorieIsLoadidState extends WelcomeArticleBlocState {
  final List<WelcomeArticle> articleList;
  const ArticleParCategorieIsLoadidState({required this.articleList});
  @override
  List<Object> get props => [articleList];
}
