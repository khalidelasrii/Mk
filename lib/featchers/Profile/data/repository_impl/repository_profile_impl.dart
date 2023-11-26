import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/exeption.dart';

import 'package:mk/core/errure/faillure.dart';

import 'package:mk/featchers/Profile/domaine/entitie/profile_user.dart';

import '../../domaine/entitie/profile_articles.dart';
import '../../domaine/repository/repository_profile.dart';
import '../data_sources/profile_data_source.dart';

class RepositoryProfileImpl implements RepositoryProfile {
  final ProfileDataSource profileDataSource;
  RepositoryProfileImpl({required this.profileDataSource});
  @override
  Future<Either<Stream<QuerySnapshot<Map<String, dynamic>>>, ProfileUser>>
      getProfile(ProfleArticle proUser) async {
    if (proUser.articleType == "") {
      return Right(await profileDataSource.getProfile(proUser));
    } else {
      return Left(await profileDataSource.getmesArticles(proUser));
    }
  }

  @override
  Future<Either<Faillure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      getMesArticle(
    ProfleArticle profleArticle,
  ) async {
    try {
      return Right(await profileDataSource.getmesArticles(profleArticle));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
