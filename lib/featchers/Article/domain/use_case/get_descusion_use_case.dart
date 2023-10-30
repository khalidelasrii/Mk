import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errure/faillure.dart';
import '../repository/profile_repository.dart';

class GetDescusionUseCase {
  final ProfileRepository _profileRepository;
  GetDescusionUseCase(this._profileRepository);

  Future<Either<Faillure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      call() async {
    return _profileRepository.getDescusion();
  }
}
