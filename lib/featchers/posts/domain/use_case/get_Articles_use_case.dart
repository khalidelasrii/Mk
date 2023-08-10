import 'package:dartz/dartz.dart';
import 'package:mk/featchers/posts/domain/repository/articles_repository.dart';

import '../../../../core/errure/faillure.dart';
import '../entitie/article.dart';

class GetArticlesUseCase {
  final RepositoryArticles repositoryArticles;

  GetArticlesUseCase({required this.repositoryArticles});

  Future<Either<Faillure, List<Article>>> call() async {
    return repositoryArticles.getArticles();
  }
}
