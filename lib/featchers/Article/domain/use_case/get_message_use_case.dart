import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/Article/data/models/profileModel.dart';
import 'package:mk/featchers/Article/domain/repository/profile_repository.dart';

class GetMessageUseCase {
  ProfileRepository profileRepository;

  GetMessageUseCase(this.profileRepository);

  Future<Either<Faillure, List<ProfileModel>>> call() async {
    return await profileRepository.getMessages();
  }
}
