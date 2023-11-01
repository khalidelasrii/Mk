import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';

import '../../data/models/message.dart';

abstract class ProfileRepository {
  Future<Either<Faillure, List<Article>>> getMesArticles();
  Future<Either<Faillure, Unit>> sendMessage(Message message);
  Future<Either<Faillure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      getMessages(String userRecuper);
  Future<Either<Faillure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      getDescusion();
}
