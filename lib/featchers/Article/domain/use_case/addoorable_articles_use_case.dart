import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';
import 'package:mk/featchers/Article/domain/repository/repository_articles.dart';

class AddoorableArticlesUseCase {
  RepositoryArticles repositoryArticles;
  AddoorableArticlesUseCase(this.repositoryArticles);
  Future<Either<Faillure, Unit>> call(Article article) async {
    return await repositoryArticles.addoorableArticle(article);
  }
}
