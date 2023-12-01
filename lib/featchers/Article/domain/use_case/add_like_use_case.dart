import 'package:dartz/dartz.dart';
import 'package:mk/featchers/Article/domain/repository/repository_articles.dart';

import '../../../../core/errure/faillure.dart';
import '../entitie/article.dart';

class AddLikeUseCase {
  RepositoryArticles repositoryArticles;
  AddLikeUseCase(this.repositoryArticles);
  Future<Either<Faillure, void>> call(Article article) async {
    return await repositoryArticles.addLike(article);
  }
}
