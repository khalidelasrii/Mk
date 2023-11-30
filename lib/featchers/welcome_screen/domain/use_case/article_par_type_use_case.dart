import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/welcome_screen/domain/entitie/welcome_article.dart';
import 'package:mk/featchers/welcome_screen/domain/repository/repository_welcome.dart';

class ArticleParTypeUseCase {
  RepositoryWelcome welcomeRepository;
  ArticleParTypeUseCase(this.welcomeRepository);

  Future<Either<Faillure, List<WelcomeArticle>>> call(String type) async {
    return await welcomeRepository.articleParType(type);
  }
}
