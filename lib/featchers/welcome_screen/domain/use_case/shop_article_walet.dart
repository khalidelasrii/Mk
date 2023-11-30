import 'package:dartz/dartz.dart';

import '../../../../core/errure/faillure.dart';
import '../entitie/welcome_article.dart';
import '../repository/repository_welcome.dart';

class ShopArticleWalet {
  RepositoryWelcome repositoryWelcome;
  ShopArticleWalet(this.repositoryWelcome);

  Future<Either<Faillure, List<WelcomeArticle>>> call() async {
    return await repositoryWelcome.shopArticleWalet();
  }
}
