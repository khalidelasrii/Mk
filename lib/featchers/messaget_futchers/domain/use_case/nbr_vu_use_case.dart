import 'package:mk/featchers/messaget_futchers/domain/repository/repository_message.dart';

class NbrVuUseCase {
  final RepositoryMesaage repositoryMesaage;
  NbrVuUseCase(this.repositoryMesaage);

  void call(String messages, int nbr) async {
    return repositoryMesaage.notificationMessages(messages, nbr);
  }
}
