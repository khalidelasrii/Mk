import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';
import 'package:mk/featchers/Authontification/domain/use_case/singin_use_case.dart';
import 'package:mk/featchers/Authontification/domain/use_case/singup_use_case.dart';

import '../../../../../core/errure/faillure.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  SingInUseCase singInUseCase;
  SingUpUseCase singUpUseCase;
  AuthBloc({required this.singInUseCase, required this.singUpUseCase})
      : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is SingInEvent) {
        emit(AwaitAuthState());
        final usr = await singInUseCase
            .call(Usr(email: event.email, id: '', password: event.password));
        usr.fold(
            (faillure) =>
                emit(AuthErrorState(message: _mapFailureTomessage(faillure))),
            (user) => emit(SingInState(usr: user)));
      } else if (event is SingUpEvent) {
        emit(AwaitAuthState());
        final usr = await singUpUseCase
            .call(Usr(id: '', email: event.email, password: event.password));
        usr.fold(
            (faillure) =>
                emit(AuthErrorState(message: _mapFailureTomessage(faillure))),
            (user) => emit(SingUpState(usr: user)));
      }
    });
  }

  String _mapFailureTomessage(Faillure faillure) {
    switch (faillure.runtimeType) {
      case ServerFailure:
        return 'Server Faillure ,Plais try again later';
      default:
        return 'Unexpected error, please try again later';
    }
  }
}
