import 'package:dartz/dartz.dart';
import 'package:mk/core/errure/faillure.dart';
import 'package:mk/featchers/messaget_futchers/domain/entitie/message.dart';
import 'package:mk/featchers/messaget_futchers/domain/repository/repository_message.dart';

class MessageVuUseCase {
  final RepositoryMesaage _repositoryMesaage;

  MessageVuUseCase(this._repositoryMesaage);

  Future<Either<Faillure, void>> call(
      String messageId, Messages message) async {
    return await _repositoryMesaage.messageVu(messageId, message);
  }
}
