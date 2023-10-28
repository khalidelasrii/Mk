part of 'messag_cubit.dart';

sealed class MessagState extends Equatable {
  const MessagState();

  @override
  List<Object> get props => [];
}

final class MessagInitial extends MessagState {}

class LodidMessagesState extends MessagState {
  final Stream<QuerySnapshot<Map<String, dynamic>>> messages;
  const LodidMessagesState({required this.messages});
  @override
  List<Object> get props => [messages];
}

class DescusionListState extends MessagState {
  final Stream<QuerySnapshot<Map<String, dynamic>>> descusions;
  const DescusionListState({required this.descusions});
  @override
  List<Object> get props => [descusions];
}

class ErrorMessagesState extends MessagState {}
