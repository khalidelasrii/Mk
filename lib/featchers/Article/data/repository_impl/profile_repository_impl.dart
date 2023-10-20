import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/exeption.dart';

import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/Article/data/models/profileModel.dart';

import 'package:mk/featchers/Article/domain/entitie/article.dart';
import 'package:mk/featchers/Article/data/data_sources/profile_data_sources.dart';

import '../../domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileDataSources profileDataSources;
  ProfileRepositoryImpl({required this.profileDataSources});
  @override
  Future<Either<Faillure, List<Article>>> getMesArticles() async {
    try {
      return Right(await profileDataSources.getmesArticles());
    } on ServerFailure {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Faillure, Unit>> sendMessage(ProfileModel message) async {
    try {
      await profileDataSources.sendMessage(message);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Faillure, List<ProfileModel>>> getMessages() async {
    try {
      return Right(await profileDataSources.getMessages());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
