import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/welcome_screen/domain/entitie/welcome_article.dart';
import 'package:mk/featchers/welcome_screen/domain/repository/welcome_repository.dart';

class ArticleParTypeUseCase {
  WelcomeRepository welcomeRepository;
  ArticleParTypeUseCase(this.welcomeRepository);

  Future<Either<Faillure, List<WelcomeArticle>>> call(String collection) async {
    return await welcomeRepository.articleParCategorie(collection);
  }
}
