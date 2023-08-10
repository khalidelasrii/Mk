import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/posts/domain/entitie/article.dart';
import 'package:mk/featchers/posts/domain/repository/articles_repository.dart';

import '../../../../core/Seccuse/success.dart';

class AddArticleUseCase {
  final RepositoryArticles repositoryArticles;

  AddArticleUseCase({required this.repositoryArticles});

  Future<Either<Faillure, Success>> call(Article article) {
    return repositoryArticles.addArticle(article);
  }
}
