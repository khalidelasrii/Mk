import 'package:equatable/equatable.dart';

abstract class Success extends Equatable {}

class SeccessDelleting extends Success {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SeccessUpdating extends Success {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SeccessAdd extends Success {
  @override
  List<Object?> get props => throw UnimplementedError();
}
