import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/Article/domain/use_case/get_message_use_case.dart';
import 'package:mk/featchers/Article/domain/use_case/send_message_use_case.dart';

part 'messag_state.dart';

class MessagCubit extends Cubit<MessagState> {
  SendMessageUseCase sendMessageUseCase;
  GetMessageUseCase getmessagesUseCase;
  MessagCubit(
      {required this.sendMessageUseCase, required this.getmessagesUseCase})
      : super(MessagInitial());

  getMessagesEvent() async {
    final messagesOrfallure = await getmessagesUseCase.call();

    messagesOrfallure.fold((_) {
      emit(ErrorMessagesState());
    }, (messages) {
      emit(LodidMessagesState(messages: messages));
    });
  }

  sendMessageEvent(String message) async {
    await sendMessageUseCase.call(message);
  }
}
