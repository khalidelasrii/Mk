import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mk/featchers/Article/domain/repository/repository_articles.dart';

import '../../../../core/errure/faillure.dart';

class GetAllArticleUseCase {
  RepositoryArticles repositoryArticles;
  GetAllArticleUseCase(this.repositoryArticles);

  Future<Either<Faillure, Stream<QuerySnapshot<Map>>>> call() async {
    return await repositoryArticles.getallArticles();
  }
}
