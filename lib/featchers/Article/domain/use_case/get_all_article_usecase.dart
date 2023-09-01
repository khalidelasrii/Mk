import 'package:dartz/dartz.dart';
import 'package:mk/featchers/Article/domain/repository/repository_articles.dart';

import '../../../../core/errure/faillure.dart';
import '../entitie/article.dart';

class GetAllArticleUseCase {
  RepositoryArticles repositoryArticles;
  GetAllArticleUseCase(this.repositoryArticles);

  Future<Either<Faillure, List<Article>>> call() async {
    return await repositoryArticles.getallArticles();
  }
}
