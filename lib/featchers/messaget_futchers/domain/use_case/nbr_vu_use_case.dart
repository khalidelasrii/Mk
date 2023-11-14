import 'package:mk/featchers/messaget_futchers/domain/entitie/message.dart';
import 'package:mk/featchers/messaget_futchers/domain/repository/repository_message.dart';

class NbrVuUseCase {
  final RepositoryMesaage repositoryMesaage;
  NbrVuUseCase(this.repositoryMesaage);

  void call(Messages messages) async {
    return repositoryMesaage.notificationMessages(messages);
  }
}
