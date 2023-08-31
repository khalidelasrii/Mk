import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/exeption.dart';
import 'package:mk/featchers/Article/data/data_sources/articles_remote_data_source.dart';
import '../../../../core/errure/faillure.dart';
import '../../domain/entitie/article.dart';
import '../../domain/repository/repository_articles.dart';
import '../models/article_model.dart';

class ArticleRepositoryImpl implements RepositoryArticles {
  final ArticlesRemoteDataSource articlesFirebase;

  ArticleRepositoryImpl({required this.articlesFirebase});

  @override
  Future<Either<Faillure, List<ArticleModel>>> getmesArticles() async {
    try {
      final remoteArticle = await articlesFirebase.getmesArticles();
      return Right(remoteArticle);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

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
  Future<Either<Faillure, Unit>> delletArticle(String id) async {
    try {
      await articlesFirebase.delletArticle(id);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Faillure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      getallArticles() async {
    try {
      final allArticles = articlesFirebase.getallArticles();
      return Right(allArticles);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
