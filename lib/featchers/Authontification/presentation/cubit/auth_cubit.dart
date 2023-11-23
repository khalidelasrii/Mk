import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mk/featchers/Authontification/domain/use_case/add_user_use_case.dart';
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
  AddUserUseCase addUserUseCase;
  AuthCubit(
      {required this.addUserUseCase,
      required this.singInGoogleUseCase,
      required this.singInUseCase,
      required this.singOutUseCase,
      required this.singUpUseCase})
      : super(AuthInitial());

  Future<void> singIn(Usr usr) async {
    final errorOrmessage = await singInUseCase.call(usr);
    errorOrmessage.fold((e) {
      emit(ErrorSingState(message: e));
    }, (user) {
      emit(IsSingInState(userId: user));
    });
  }

  Future<void> singOut() async {
    await singOutUseCase.call();
    emit(const IsSingOutstate(message: ''));
  }

  Future<void> singUp(Usr usr) async {
    final singupOrmessage = await singUpUseCase(usr);
    singupOrmessage.fold((message) {
      emit(ErrorSingState(message: message));
    }, (user) {
      emit(IsSingInState(userId: user));
    });
  }

  Future<void> addUser(Usr user) async {
    await addUserUseCase(user);
  }

  Future<void> singGoogle() async {
    final singOrmessage = await singInGoogleUseCase();

    singOrmessage.fold((ee) {
      emit(ErrorSingState(message: ee));
    }, (user) {
      emit(IsSingInState(userId: user!.user));
    });
  }
}
