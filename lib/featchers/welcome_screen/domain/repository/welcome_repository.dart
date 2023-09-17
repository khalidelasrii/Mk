import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/welcome_screen/domain/entitie/welcome_article.dart';

abstract class WelcomeRepository {
  Future<Either<Faillure, List<WelcomeArticle>>> getAllWelcomeArticle();
}
