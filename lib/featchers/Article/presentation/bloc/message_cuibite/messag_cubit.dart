import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/Article/domain/use_case/get_descusion_use_case.dart';
import 'package:mk/featchers/Article/domain/use_case/get_message_use_case.dart';
import 'package:mk/featchers/Article/domain/use_case/send_message_use_case.dart';

import '../../../data/models/message.dart';

part 'messag_state.dart';

class MessagCubit extends Cubit<MessagState> {
  SendMessageUseCase sendMessageUseCase;
  GetMessageUseCase getmessagesUseCase;
  GetDescusionUseCase getDescusionUseCase;
  MessagCubit(
      {required this.getDescusionUseCase,
      required this.sendMessageUseCase,
      required this.getmessagesUseCase})
      : super(MessagInitial());

  getMessagesEvent(String userRecuper) async {
    final messagesOrfallure = await getmessagesUseCase.call(userRecuper);

    messagesOrfallure.fold((_) {
      emit(ErrorMessagesState());
    }, (messages) {
      emit(LodidMessagesState(messages: messages));
    });
  }

  sendMessageEvent(Message message) async {
    await sendMessageUseCase.call(message);
  }

  getDescusionsEvent() async {
    final descusinsOrFaillure = await getDescusionUseCase.call();

    descusinsOrFaillure.fold((l) {
      emit(ErrorMessagesState());
    }, (rrr) {
      emit(DescusionListState(descusions: rrr));
    });
  }
}
