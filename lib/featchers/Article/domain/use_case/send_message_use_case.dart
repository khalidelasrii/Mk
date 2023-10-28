import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/Article/domain/repository/profile_repository.dart';

import '../../data/models/message.dart';

class SendMessageUseCase {
  ProfileRepository profileRepository;
  SendMessageUseCase(this.profileRepository);

  Future<Either<Faillure, Unit>> call(Message message) async {
    return await profileRepository.sendMessage(message);
  }
}
