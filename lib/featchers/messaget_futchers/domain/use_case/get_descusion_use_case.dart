import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mk/featchers/messaget_futchers/domain/repository/repository_message.dart';

import '../../../../core/errure/faillure.dart';

class GetDescusionUseCase {
  RepositoryMesaage repositoryMesaage;
  GetDescusionUseCase(this.repositoryMesaage);
  Future<Either<Faillure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      call() async {
    return await repositoryMesaage.getDescusion();
  }
}
