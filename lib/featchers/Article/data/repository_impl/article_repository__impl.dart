import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/exeption.dart';
import 'package:mk/featchers/Article/data/data_sources/articles_remote_data_source.dart';
import '../../../../core/errure/faillure.dart';
import '../../domain/entitie/article.dart';
import '../../domain/repository/repository_articles.dart';

class ArticleRepositoryImpl implements RepositoryArticles {
  final ArticlesRemoteDataSource articlesFirebase;

  ArticleRepositoryImpl({required this.articlesFirebase});

  @override
  Future<Either<Faillure, Unit>> addArticle(Article article) async {
    try {
      await articlesFirebase.addArticle(article);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Faillure, Unit>> updateArticle(Article article) async {
    try {
      await articlesFirebase.updateArticle(article);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Faillure, Unit>> delletArticle(
      String collectionId, String id) async {
    try {
      await articlesFirebase.delletArticle(collectionId, id);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Faillure, List<Article>>> getallArticles() async {
    try {
      return Right(await articlesFirebase.getAllArticles());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Faillure, Unit>> addoorableArticle(Article article) async {
    try {
      await articlesFirebase.addoorableArticle(article);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
