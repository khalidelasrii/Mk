import 'package:dartz/dartz.dart';

import '../../../../core/errure/faillure.dart';
import '../entitie/article.dart';
import '../repository/repository_articles.dart';

class GetArticlesUseCase {
  final RepositoryArticles repositoryArticles;

  GetArticlesUseCase(this.repositoryArticles);

  Future<Either<Faillure, List<Article>>> call() async {
    return await repositoryArticles.getArticles();
  }
}
