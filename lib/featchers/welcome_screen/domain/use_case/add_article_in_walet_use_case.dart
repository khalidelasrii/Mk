import 'package:mk/featchers/welcome_screen/domain/entitie/welcome_article.dart';
import 'package:mk/featchers/welcome_screen/domain/repository/repository_welcome.dart';

class AddArticleInWaletUseCase {
  RepositoryWelcome repositoryWelcome;
  AddArticleInWaletUseCase(this.repositoryWelcome);

  Future<void> call(WelcomeArticle article) async {
    return await repositoryWelcome.addArticleInwalet(article);
  }
}
