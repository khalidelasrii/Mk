import 'package:dartz/dartz.dart';

import 'package:mk/core/errure/faillure.dart';

import 'package:mk/featchers/Article/domain/entitie/article.dart';
import 'package:mk/featchers/profile/data/data_sources/profile_data_sources.dart';

import '../../domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileDataSources profileDataSources;
  ProfileRepositoryImpl({required this.profileDataSources});
  @override
  Future<Either<Faillure, List<Article>>> getMesArticles(String profile) async {
    try {
      return Right(await profileDataSources.getmesArticles(profile));
    } on ServerFailure {
      return Left(ServerFailure());
    }
  }
}
