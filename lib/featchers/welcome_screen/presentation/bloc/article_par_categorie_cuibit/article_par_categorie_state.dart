part of 'article_par_categorie_cubit.dart';

sealed class ArticleParCategorieState extends Equatable {
  const ArticleParCategorieState();

  @override
  List<Object> get props => [];
}

final class ArticleParCategorieInitial extends ArticleParCategorieState {}

class ArticleParCategorieIsLoadidState extends ArticleParCategorieState {
  final List<WelcomeArticle> articleList;
  const ArticleParCategorieIsLoadidState({required this.articleList});
  @override
  List<Object> get props => [articleList];
}

class ArticleParCategorieErrorState extends ArticleParCategorieState {
  final String message;
  const ArticleParCategorieErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
