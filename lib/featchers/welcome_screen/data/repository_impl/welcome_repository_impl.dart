import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/welcome_screen/domain/entitie/welcome_article.dart';
import 'package:mk/featchers/welcome_screen/domain/repository/welcome_repository.dart';

class WelcomeRepositoryImpl implements WelcomeRepository {
  @override
  Future<Either<Faillure, List<WelcomeArticle>>> getAllWelcomeArticle() {
    throw UnimplementedError();
  }
}
