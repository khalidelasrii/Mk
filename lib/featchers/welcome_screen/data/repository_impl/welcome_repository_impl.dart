import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/exeption.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/Profile/domaine/entitie/profile_user.dart';
import 'package:mk/featchers/welcome_screen/data/models/welcome_article_model.dart';
import 'package:mk/featchers/welcome_screen/domain/entitie/welcome_article.dart';
import 'package:mk/featchers/welcome_screen/domain/repository/repository_welcome.dart';

import '../data_sources/welcome_data_source.dart';

class WelcomeRepositoryImpl implements RepositoryWelcome {
  WelcomeDataSource welcomeDataSource;
  WelcomeRepositoryImpl({required this.welcomeDataSource});
  @override
  Future<Either<Faillure, List<WelcomeArticle>>> getAllArticle() async {
    try {
      return Right(await welcomeDataSource.getAllArticle());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Faillure, List<WelcomeArticle>>> articleParType(
      String type) async {
    try {
      return Right(await welcomeDataSource.articlePartype(type));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> searchResults(
      String query) async {
    return await welcomeDataSource.searchResults(query);
  }

  @override
  Future<Either<Faillure, List<ProfileUser>>> getUsers() async {
    try {
      return Right(await welcomeDataSource.getUsers());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Faillure, List<WelcomeArticle>>> shopArticleWalet() async {
    try {
      return Right(await welcomeDataSource.shopArticleWalet());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<void> addArticleInwalet(WelcomeArticle article) async {
    return await welcomeDataSource.addArticleInWalet(WelcomeArticleModel(
        article: article.article,
        articleId: article.articleId,
        articleType: article.articleType,
        articleUrl: article.articleUrl,
        email: article.email,
        name: article.name,
        prix: article.prix,
        uid: article.uid,
        date: article.date));
  }
}
