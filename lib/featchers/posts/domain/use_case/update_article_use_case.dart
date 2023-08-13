import 'package:dartz/dartz.dart';
import 'package:mk/featchers/posts/domain/entitie/article.dart';
import 'package:mk/featchers/posts/domain/repository/repository_articles.dart';

import '../../../../core/errure/faillure.dart';

class UpdateArticleUseCase {
  final RepositoryArticles repositoryArticles;

  UpdateArticleUseCase(this.repositoryArticles);

  Future<Either<Faillure, Unit>> call(Article article) async {
    return await repositoryArticles.updateArticle(article);
  }
}
