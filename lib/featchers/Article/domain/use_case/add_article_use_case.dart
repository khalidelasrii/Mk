import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';
import 'package:mk/featchers/Article/domain/repository/repository_articles.dart';

class AddArticleUseCase {
  final RepositoryArticles repositoryArticles;

  AddArticleUseCase(this.repositoryArticles);

  Future<Either<Faillure, String>> call(Article article) async {
    return await repositoryArticles.addArticle(article);
  }
}
