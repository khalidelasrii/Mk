import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/Article/domain/repository/profile_repository.dart';

class GetMessageUseCase {
  ProfileRepository profileRepository;

  GetMessageUseCase(this.profileRepository);

  Future<Either<Faillure, Stream<QuerySnapshot<Map<String, dynamic>>>>> call(
      String userRecuper) async {
    return await profileRepository.getMessages(userRecuper);
  }
}
