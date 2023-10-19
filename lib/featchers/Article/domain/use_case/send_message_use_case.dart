import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/Article/data/models/profileModel.dart';
import 'package:mk/featchers/Article/domain/repository/profile_repository.dart';

class SendMessageUseCase {
  ProfileRepository profileRepository;
  SendMessageUseCase(this.profileRepository);

  Future<Either<Faillure, Unit>> call(ProfileModel message) async {
    return await profileRepository.sendMessage(message);
  }
}
