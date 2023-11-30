import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/welcome_screen/domain/entitie/welcome_article.dart';
import 'package:mk/featchers/welcome_screen/domain/repository/repository_welcome.dart';

class GetAllWelcomeArticleUseCase {
  RepositoryWelcome welcomeRepository;
  GetAllWelcomeArticleUseCase(this.welcomeRepository);
  Future<Either<Faillure, List<WelcomeArticle>>> call() async {
    return await welcomeRepository.getAllArticle();
  }
}
