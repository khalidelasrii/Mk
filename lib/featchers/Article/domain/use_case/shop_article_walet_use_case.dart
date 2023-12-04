import 'package:cloud_firestore/cloud_firestore.dart';

import '../repository/repository_articles.dart';

class ShopArticleWaletUseCase {
  RepositoryArticles repositoryWelcome;
  ShopArticleWaletUseCase(this.repositoryWelcome);

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> call() async {
    return await repositoryWelcome.shopArticleWalet();
  }
}
