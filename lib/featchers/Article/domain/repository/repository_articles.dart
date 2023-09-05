import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';

import '../../../../core/errure/faillure.dart';

abstract class RepositoryArticles {
  Future<Either<Faillure, List<Article>>> getmesArticles();

  Future<Either<Faillure, List<Article>>> getallArticles();

  Future<Either<Faillure, Unit>> updateArticle(Article article);

  Future<Either<Faillure, Unit>> addArticle(Article article);

  Future<Either<Faillure, Unit>> delletArticle(String collectionId, String id);
}
