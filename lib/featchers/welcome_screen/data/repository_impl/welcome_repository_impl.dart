import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/exeption.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/welcome_screen/domain/entitie/welcome_article.dart';
import 'package:mk/featchers/welcome_screen/domain/repository/welcome_repository.dart';

import '../data_sources/welcome_data_source.dart';

class WelcomeRepositoryImpl implements WelcomeRepository {
  WelcomeDataSource welcomeDataSource;
  WelcomeRepositoryImpl({required this.welcomeDataSource});
  @override
  Future<Either<Faillure, List<WelcomeArticle>>> getAllWelcomeArticle() async {
    try {
      return Right(await welcomeDataSource.getAllArticle());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Faillure, List<WelcomeArticle>>> articleParCategorie(
      String collection) async {
    try {
      return Right(await welcomeDataSource.articlePartype(collection));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Stream<QuerySnapshot<Object?>> getSearchResults(String query) {
    return welcomeDataSource.getSearchResults(query);
  }
}
