import 'package:dartz/dartz.dart';
import 'package:mk/featchers/posts/domain/entitie/article.dart';

import '../../../../core/Seccuse/success.dart';
import '../../../../core/errure/faillure.dart';

abstract class RepositoryArticles {
  Future<Either<Faillure, List<Article>>> getArticles() {
    // TODO: implement getArticles
    throw UnimplementedError();
  }

  Future<Either<Faillure, Unit>> updateArticle(Article article) {
    // TODO: implement updateArticle
    throw UnimplementedError();
  }

  Future<Either<Faillure, Success>> addArticle(Article article) {
    throw UnimplementedError();
  }

  Future<Either<Faillure, Success>> delletArticle(int id) {
    throw UnimplementedError();
  }
}
