part of 'recherch_cubit.dart';

sealed class RecherchState extends Equatable {
  const RecherchState();

  @override
  List<Object> get props => [];
}

final class RecherchInitial extends RecherchState {}

class RecherchStartstate extends RecherchState {
  final Stream<QuerySnapshot> value;

  const RecherchStartstate(this.value);
  @override
  List<Object> get props => [value];
}
