import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/Authontification/domain/use_case/sing_in_google_use_case.dart';
import 'package:mk/featchers/Authontification/domain/use_case/sing_out_usecase.dart';
import 'package:mk/featchers/Authontification/domain/use_case/singin_use_case.dart';
import 'package:mk/featchers/Authontification/domain/use_case/singup_use_case.dart';

import '../../domain/entitie/user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  SingInUseCase singInUseCase;
  SingOutUseCase singOutUseCase;
  SingUpUseCase singUpUseCase;
  SingInGoogleUseCase singInGoogleUseCase;
  AuthCubit(
      {required this.singInGoogleUseCase,
      required this.singInUseCase,
      required this.singOutUseCase,
      required this.singUpUseCase})
      : super(AuthInitial());

  Future<void> singIn(Usr usr) async {
    try {
      await singInUseCase.call(usr);
      emit(const IsSingInState(message: "Succes"));
    } catch (e) {
      emit(ErrorSingState(message: "$e"));
    }
  }

  Future<void> singOut() async {
    await singOutUseCase.call();
    emit(const IsSingOutstate(message: ''));
  }

  Future<void> singUp(Usr usr) async {
    try {
      await singUpUseCase(usr);
      emit(const IsSingInState(message: "Succes"));
    } catch (e) {
      emit(ErrorSingState(message: "$e"));
    }
  }

  Future<void> singGoogle() async {
    try {
      await singInGoogleUseCase();
      emit(const IsSingInState(message: "Succes"));
    } catch (e) {
      emit(ErrorSingState(message: "$e"));
    }
  }
}
