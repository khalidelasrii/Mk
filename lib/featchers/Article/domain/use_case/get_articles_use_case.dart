import 'package:dartz/dartz.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';

import '../../../../core/errure/faillure.dart';
import '../repository/repository_articles.dart';

class GetArticlesUseCase {
  final RepositoryArticles repositoryArticles;

  GetArticlesUseCase(this.repositoryArticles);

  Future<Either<Faillure, List<Article>>> call() async {
    return await repositoryArticles.getmesArticles();
  }
}
