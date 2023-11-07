import 'package:dartz/dartz.dart';
import 'package:mk/featchers/messaget_futchers/domain/entitie/message.dart';
import 'package:mk/featchers/messaget_futchers/domain/repository/repository_message.dart';

import '../../../../core/errure/faillure.dart';

class SendMessageUseCase {
  RepositoryMesaage repositoryMesaage;
  SendMessageUseCase(this.repositoryMesaage);

  Future<Either<Faillure, Unit>> call(Messages messages) {
    return repositoryMesaage.sendMessage(messages);
  }
}
