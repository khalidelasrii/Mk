import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mk/featchers/Authontification/domain/use_case/sing_out_usecase.dart';
import 'package:mk/featchers/Authontification/domain/use_case/singin_use_case.dart';
import 'package:mk/featchers/Authontification/domain/use_case/singup_use_case.dart';

import '../../../domain/entitie/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  SingInUseCase singInUseCase;
  SingUpUseCase singUpUseCase;
  SingOutUseCase singOutUseCase;
  AuthBloc({
    required this.singOutUseCase,
    required this.singInUseCase,
    required this.singUpUseCase,
  }) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is SingInEvent) {
        // ! catche the email and password and sing in ;
        final usr = Usr(email: event.email, password: event.password);
        final singin = await singInUseCase.call(usr);
        // ! catche the email and password and sing in ;
        singin.fold((message) {
          emit(AuthErrorState(message: message));
        }, (user) {
          user == null ? emit(SingOutState()) : emit(SingInState(usr: user));
        });
      } else if (event is SingOutEvent) {
        singOutUseCase.call();
        emit(SingOutState());
        print('Sing out beby ');
      }
    });
  }
}
