import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/posts/domain/entitie/article.dart';
import 'package:mk/featchers/posts/domain/repository/repository_articles.dart';

class AddArticleUseCase {
  final RepositoryArticles repositoryArticles;

  AddArticleUseCase(this.repositoryArticles);

  Future<Either<Faillure, Unit>> call(Article article) async {
    return await repositoryArticles.addArticle(article);
  }
}
