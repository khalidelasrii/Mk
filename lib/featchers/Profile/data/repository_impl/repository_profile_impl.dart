import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/exeption.dart';

import 'package:mk/core/errure/faillure.dart';

import 'package:mk/featchers/Profile/domaine/entitie/profile_user.dart';

import '../../domaine/repository/repository_profile.dart';
import '../data_sources/profile_data_source.dart';

class RepositoryProfileImpl implements RepositoryProfile {
  final ProfileDataSource profileDataSource;
  RepositoryProfileImpl({required this.profileDataSource});
  @override
  Future<Either<Faillure, ProfileUser>> getAutreProfile(
      ProfileUser proUser) async {
    try {
      return Right(await profileDataSource.getAutreProfile(proUser));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Faillure, ProfileUser>> getMyProfile() async {
    try {
      return Right(await profileDataSource.getMyProfile());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Faillure, Stream<QuerySnapshot>>> getMesArticle(
      String typearticle) async {
    try {
      return Right(await profileDataSource.getmesArticles(typearticle));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
