import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/exeption.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/messaget_futchers/datat/data_sources/data_sources.dart';
import 'package:mk/featchers/messaget_futchers/domain/entitie/message.dart';
import 'package:mk/featchers/messaget_futchers/domain/repository/repository_message.dart';

class RepositoryImplMessage implements RepositoryMesaage {
  RepositoryImplMessage({required this.dataSourcesMessages});
  final DataSourcesMessages dataSourcesMessages;
  @override
  Future<Either<Faillure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      getDescusion() async {
    try {
      return Right(await dataSourcesMessages.getDescusion());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Faillure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      getMessages(String userRecuper) async {
    try {
      return Right(await dataSourcesMessages.getMessages(userRecuper));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Faillure, Unit>> sendMessage(Messages message) async {
    try {
      await dataSourcesMessages.sendMessage(message);
      return Right(await Future.value(unit));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Faillure, void>> messageVu(Messages message) async {
    try {
      await dataSourcesMessages.messageVu(message);
      // ignore: void_checks
      return Right(Future.value());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
