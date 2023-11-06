import 'package:mk/featchers/messaget_futchers/domain/entitie/message.dart';

class ModelMessage extends Messages {
  const ModelMessage(
      {required super.message,
      super.dateTime,
      super.descusionId,
      super.emailRecuper,
      super.emailSender});

  Map toMap() {
    return {
      "message": message,
      "dateTime": dateTime,
      "descusionId": descusionId,
      "emailRecuper": emailRecuper,
      "emailSender": emailSender,
    };
  }
}
