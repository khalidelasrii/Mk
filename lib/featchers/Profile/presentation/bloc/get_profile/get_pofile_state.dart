part of 'get_pofile_cubit.dart';

sealed class GetPofileState extends Equatable {
  const GetPofileState();

  @override
  List<Object> get props => [];
}

final class GetPofileInitial extends GetPofileState {}

class LodidAutreProfileState extends GetPofileState {
  final ProfileUser articles;
  const LodidAutreProfileState({required this.articles});
  @override
  List<Object> get props => [articles];
}

class ErrorProfileState extends GetPofileState {
  final String message;
  const ErrorProfileState({required this.message});

  @override
  List<Object> get props => [message];
}
