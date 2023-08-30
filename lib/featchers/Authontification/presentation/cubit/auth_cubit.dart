import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/Authontification/domain/use_case/get_user_id_usecase.dart';
import 'package:mk/featchers/Authontification/domain/use_case/sing_in_google_use_case.dart';
import 'package:mk/featchers/Authontification/domain/use_case/sing_out_usecase.dart';
import 'package:mk/featchers/Authontification/domain/use_case/singin_use_case.dart';
import 'package:mk/featchers/Authontification/domain/use_case/singup_use_case.dart';

import '../../domain/entitie/user.dart';
import '../../domain/use_case/is_singin_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  SingInUseCase singInUseCase;
  SingOutUseCase singOutUseCase;
  SingUpUseCase singUpUseCase;
  IsSingInUsecase isSingInUsecase;
  GetUserIdUSecase getUserIdUSecase;
  SingInGoogleUseCase singInGoogleUseCase;
  AuthCubit(
      {required this.getUserIdUSecase,
      required this.singInGoogleUseCase,
      required this.isSingInUsecase,
      required this.singInUseCase,
      required this.singOutUseCase,
      required this.singUpUseCase})
      : super(AuthInitial());

  Future<void> appStart() async {
    bool connect = await isSingInUsecase.call();
    if (connect == true) {
      final userid = await getUserIdUSecase.call();
      emit(IsSingInState(userId: userid));
    } else {
      emit(const IsSingOutstate(message: 'try to connect'));
    }
  }

  Future<void> singIn(Usr usr) async {
    emit(LodingAuthState());
    try {
      final errorOrmessage = await singInUseCase.call(usr);
      final userId = await getUserIdUSecase.call();
      errorOrmessage.fold((e) {
        emit(ErrorSingState(message: e));
      }, (_) {
        emit(IsSingInState(userId: userId));
      });
    } catch (e) {
      emit(const ErrorSingState(message: 'Email Or password Error'));
    }
  }

  Future<void> singOut() async {
    try {
      await singOutUseCase.call();
      emit(const IsSingOutstate(message: 'error to sing out plaise try agine'));
    } catch (_) {
      emit(const IsSingOutstate(message: 'error to sing out plaise try agine'));
    }
  }

  Future<void> singUp(Usr usr) async {
    emit(LodingAuthState());
    final singupOrmessage = await singUpUseCase.call(usr);
    final userId = await getUserIdUSecase();
    singupOrmessage.fold((message) => emit(ErrorSingState(message: message)),
        (_) => emit(IsSingInState(userId: userId)));
  }

  Future<void> singGoogle() async {
    try {
      emit(LodingAuthState());
      final singOrmessage = await singInGoogleUseCase();
      final userid = await getUserIdUSecase();
      singOrmessage.fold((ee) => emit(ErrorSingState(message: ee)),
          (_) => IsSingInState(userId: userid));
    } catch (e) {
      emit(ErrorSingState(message: '$e'));
    }
  }
}
