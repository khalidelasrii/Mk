part of 'messag_cubit.dart';

sealed class MessagState extends Equatable {
  const MessagState();

  @override
  List<Object> get props => [];
}

final class MessagInitial extends MessagState {}

class LodidMessagesState extends MessagState {
  final List<ProfileModel> messages;
  const LodidMessagesState({required this.messages});
}

class ErrorMessagesState extends MessagState {}
