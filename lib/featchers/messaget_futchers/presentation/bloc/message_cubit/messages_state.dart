part of 'messages_cubit.dart';

sealed class MessagesState extends Equatable {
  const MessagesState();

  @override
  List<Object> get props => [];
}

final class MessagesInitial extends MessagesState {}

class LodidMessagesState extends MessagesState {
  final Stream<QuerySnapshot<Map<String, dynamic>>> messages;
  const LodidMessagesState({required this.messages});

  @override
  List<Object> get props => [messages];
}

class ErrorMessagesState extends MessagesState {}
