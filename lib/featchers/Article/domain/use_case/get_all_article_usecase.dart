import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mk/featchers/Article/domain/repository/repository_articles.dart';

import '../../../../core/errure/faillure.dart';

class GetAllArticleUseCase {
  RepositoryArticles repositoryArticles;
  GetAllArticleUseCase({required this.repositoryArticles});

  Future<Either<Faillure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      call() async {
    return await repositoryArticles.getallArticles();
  }
}
