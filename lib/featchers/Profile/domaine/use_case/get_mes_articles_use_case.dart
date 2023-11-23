import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';

import '../repository/repository_profile.dart';

class GetMesArticlesUseCase {
  RepositoryProfile repositoryProfile;

  GetMesArticlesUseCase(this.repositoryProfile);
  Future<Either<Faillure, Stream<QuerySnapshot<Map<String, dynamic>>>>> call(
      String typearticle) async {
    return await repositoryProfile.getMesArticle(typearticle);
  }
}
