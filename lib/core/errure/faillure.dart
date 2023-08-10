import 'package:equatable/equatable.dart';

abstract class Faillure extends Equatable {}

class ServerFaillure extends Faillure {
  @override
  List<Object?> get props => throw UnimplementedError();
}
