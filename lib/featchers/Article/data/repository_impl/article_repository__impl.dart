import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/exeption.dart';
import 'package:mk/featchers/Article/data/data_sources/articles_remote_data_source.dart';
import 'package:mk/featchers/Article/data/models/article_model.dart';
import '../../../../core/errure/faillure.dart';
import '../../domain/entitie/article.dart';
import '../../domain/repository/repository_articles.dart';

class ArticleRepositoryImpl implements RepositoryArticles {
  final ArticlesRemoteDataSource articlesFirebase;

  ArticleRepositoryImpl({required this.articlesFirebase});

  @override
  Future<Either<Faillure, List<Article>>> getArticles() async {
    try {
      final remoteArticle = await articlesFirebase.getArticles();
      return right(remoteArticle);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Faillure, Unit>> addArticle(Article article) async {
    final ArticleModel articleModel = ArticleModel(
        id: article.id,
        article: article.article,
        name: article.name,
        prix: article.prix);
    try {
      await articlesFirebase.addArticle(articleModel);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Faillure, Unit>> updateArticle(Article article) async {
    final ArticleModel articleModel = ArticleModel(
        id: article.id,
        article: article.article,
        name: article.name,
        prix: article.prix);
    try {
      await articlesFirebase.updateArticle(articleModel);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Faillure, Unit>> delletArticle(String id) async {
    try {
      await articlesFirebase.delletArticle(id);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
