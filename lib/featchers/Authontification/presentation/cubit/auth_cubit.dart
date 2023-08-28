import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/Authontification/domain/use_case/get_user_id_usecase.dart';
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
  AuthCubit(
      {required this.getUserIdUSecase,
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
    final errorOrmessage = await singInUseCase.call(usr);
    final userId = await getUserIdUSecase.call();
    errorOrmessage.fold((e) {
      emit(ErrorSingState(message: e));
    }, (_) {
      emit(IsSingInState(userId: userId));
    });
  }

  Future<void> singOut() async {
    try {
      await singOutUseCase.call();
      emit(const IsSingOutstate(message: 'error to sing out plaise try agine'));
    } catch (_) {
      emit(const IsSingOutstate(message: 'error to sing out plaise try agine'));
    }
  }
}
