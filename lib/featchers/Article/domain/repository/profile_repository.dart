import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';

abstract class ProfileRepository {
  Future<Either<Faillure, List<Article>>> getMesArticles();
}
