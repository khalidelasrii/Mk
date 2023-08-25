import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';

import '../../../../core/errure/faillure.dart';

abstract class RepositoryArticles {
  Future<Either<Faillure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      getArticles();

  Future<Either<Faillure, Unit>> updateArticle(Article article);

  Future<Either<Faillure, Unit>> addArticle(Article article);

  Future<Either<Faillure, Unit>> delletArticle(String id);
}
