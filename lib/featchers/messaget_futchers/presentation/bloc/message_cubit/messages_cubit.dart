import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/messaget_futchers/domain/entitie/message.dart';
import 'package:mk/featchers/messaget_futchers/domain/use_case/get_message_use_case.dart';
import 'package:mk/featchers/messaget_futchers/domain/use_case/message_vu.dart';
import 'package:mk/featchers/messaget_futchers/domain/use_case/send_message_use_case.dart';

part 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  GetMessageUseCase getMessageUseCase;
  SendMessageUseCase sendMessageUseCase;
  MessageVuUseCase messageVuUseCase;
  MessagesCubit(
      {required this.messageVuUseCase,
      required this.getMessageUseCase,
      required this.sendMessageUseCase})
      : super(MessagesInitial());

  sendMessageEvent(Messages message) async {
    await sendMessageUseCase(message);
  }

  messageVuEvent(Messages message) async {
    await messageVuUseCase.call(message);
  }

  initialEvent() {
    emit(MessagesInitial());
  }

  notificationMessageEvent(String messageTo) async {
    final messagesOrfaillure = await getMessageUseCase.call(messageTo);
    messagesOrfaillure.fold((_) {
      emit(ErrorMessagesState());
    }, (r) {
      emit(NotificationMessageState(messages: r));
    });
  }

  getMessagesEvent(String messageTo) async {
    final messagesOrfaillure = await getMessageUseCase(messageTo);
    messagesOrfaillure.fold((_) {
      emit(ErrorMessagesState());
    }, (r) {
      emit(LodidMessagesState(messages: r));
    });
  }
}
