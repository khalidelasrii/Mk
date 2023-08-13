import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/posts/domain/repository/repository_articles.dart';

class DelletArticleUseCase {
  final RepositoryArticles repositoryArticles;

  DelletArticleUseCase(this.repositoryArticles);

  Future<Either<Faillure, Unit>> call(String id) async {
    return await repositoryArticles.delletArticle(id);
  }
}
