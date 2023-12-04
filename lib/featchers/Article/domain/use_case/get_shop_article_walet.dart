import 'package:mk/featchers/Article/domain/repository/repository_articles.dart';

import '../entitie/article.dart';

class GetShopArticleWaletUseCase {
  RepositoryArticles repositoryArticles;
  GetShopArticleWaletUseCase(this.repositoryArticles);
  Future<List<Article>> call() async {
    return await repositoryArticles.getShopArticleWalet();
  }
}
