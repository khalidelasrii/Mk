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
        Usr usr = Usr(email: event.email, password: event.password);
        final successorfaild = await singInUseCase.call(usr);

        successorfaild.fold((error) {
          emit(SingInFalseState(isConnect: error));
        }, (_) {
          emit(const SingInSuccesState(isConnect: 'Welcome Home'));
        });
      }
    });
  }
}
