part of 'descusion_cubit.dart';

sealed class DescusionState extends Equatable {
  const DescusionState();

  @override
  List<Object> get props => [];
}

final class DescusionInitial extends DescusionState {}

class LodidDescusionState extends DescusionState {
  final Stream<QuerySnapshot<Map<String, dynamic>>> descusions;
  const LodidDescusionState({required this.descusions});
  @override
  List<Object> get props => [descusions];
}

class ErrorDescusionState extends DescusionState {}
