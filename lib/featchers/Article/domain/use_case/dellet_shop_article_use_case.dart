import '../repository/repository_articles.dart';

class DelletShopArticleUseCase {
  RepositoryArticles repositoryArticle;
  DelletShopArticleUseCase(this.repositoryArticle);

  Future<void> call(String articleId) async {
    await repositoryArticle.delletShopArticleWalet(articleId);
  }
}
