import 'package:mk/featchers/Article/domain/entitie/article.dart';

import '../repository/repository_articles.dart';

class AddArticleInWaletUseCase {
  final RepositoryArticles repositoryWelcome;
  AddArticleInWaletUseCase(this.repositoryWelcome);

  Future<void> call(Article article) async {
    return await repositoryWelcome.addArticleInwalet(article);
  }
}
