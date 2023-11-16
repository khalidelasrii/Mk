import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mk/featchers/messaget_futchers/domain/entitie/message.dart';

import '../../../../core/errure/faillure.dart';

abstract class RepositoryMesaage {
  Future<Either<Faillure, Unit>> sendMessage(Messages message);
  Future<Either<Faillure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      getMessages(String userRecuper);
  Future<Either<Faillure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      getDescusion();
  Future<Either<Faillure, void>> messageVu(Messages message);
  void notificationMessages(String emailre, int nbr);
}
