part of 'addordeletorupdate_bloc.dart';

sealed class AddordeletorupdateState extends Equatable {
  const AddordeletorupdateState();

  @override
  List<Object> get props => [];
}

final class AddordeletorupdateInitial extends AddordeletorupdateState {}

class LodingAddDeleteUpdateArticleState extends AddordeletorupdateState {}

class ErrorAddDeleteUpdateState extends AddordeletorupdateState {
  final String message;

  const ErrorAddDeleteUpdateState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageAddDeleteUpdatePostState extends AddordeletorupdateState {
  final String message;

  const MessageAddDeleteUpdatePostState({required this.message});
  @override
  List<Object> get props => [message];
}
