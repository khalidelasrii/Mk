import 'package:dartz/dartz.dart';
import 'package:mk/featchers/posts/domain/entitie/article.dart';
import 'package:mk/featchers/posts/domain/repository/articles_repository.dart';

import '../../../../core/errure/faillure.dart';

class UpdateArticleUseCase {
  final RepositoryArticles repositoryArticles;

  UpdateArticleUseCase({required this.repositoryArticles});

  Future<Either<Faillure, Unit>> call(Article article) async {
    return repositoryArticles.updateArticle(article);
  }
}
