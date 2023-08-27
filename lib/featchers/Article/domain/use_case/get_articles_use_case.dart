import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errure/faillure.dart';
import '../repository/repository_articles.dart';

class GetArticlesUseCase {
  final RepositoryArticles repositoryArticles;

  GetArticlesUseCase(this.repositoryArticles);

  Future<Either<Faillure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      call() async {
    return await repositoryArticles.getArticles();
  }
}
