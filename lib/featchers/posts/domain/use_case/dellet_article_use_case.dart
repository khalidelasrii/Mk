import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/posts/domain/repository/articles_repository.dart';

class DelletArticleUseCase {
  final RepositoryArticles repositoryArticles;

  DelletArticleUseCase({required this.repositoryArticles});

  Future<Either<Faillure, Unit>> call(String id) {
    return repositoryArticles.delletArticle(id);
  }
}
