import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/exeption.dart';
import 'package:mk/featchers/posts/data/data_sources/articles_remote_data_source.dart';
import 'package:mk/featchers/posts/data/models/article_model.dart';
import '../../../../core/errure/faillure.dart';
import '../../domain/entitie/article.dart';
import '../../domain/repository/articles_repository.dart';

class ArticleRepositoryImpl implements RepositoryArticles {
  final ArticlesRemoteDataSource articlesRemoteDataSource;

  ArticleRepositoryImpl(this.articlesRemoteDataSource);

  @override
  Future<Either<Faillure, List<Article>>> getArticles() async {
    try {
      final remoteArticle = await articlesRemoteDataSource.getArticles();
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
      await articlesRemoteDataSource.addArticle(articleModel);
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
      await articlesRemoteDataSource.updateArticle(articleModel);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Faillure, Unit>> delletArticle(String id) async {
    try {
      await articlesRemoteDataSource.delletArticle(id);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
