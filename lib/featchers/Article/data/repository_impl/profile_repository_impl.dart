import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/exeption.dart';

import 'package:mk/core/errure/faillure.dart';

import 'package:mk/featchers/Article/domain/entitie/article.dart';
import 'package:mk/featchers/Article/data/data_sources/profile_data_sources.dart';

import '../../domain/repository/profile_repository.dart';
import '../models/message.dart';

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
  Future<Either<Faillure, Unit>> sendMessage(Message message) async {
    try {
      await profileDataSources.sendMessage(message);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Faillure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      getMessages() async {
    try {
      return Right(profileDataSources.getMessages());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Faillure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      getDescusion() async {
    try {
      return Right(profileDataSources.getDescusion());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
