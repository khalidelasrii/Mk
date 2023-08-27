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
    try {
      bool connect = await isSingInUsecase.call();
      if (connect == true) {
        final userid = await getUserIdUSecase.call();
        emit(IsSingInState(userId: userid));
      } else {
        emit(IsSingOutstate());
      }
    } catch (_) {
      emit(IsSingOutstate());
    }
  }

  Future<void> singIn(Usr usr) async {
    try {
      final errorOrmessage = await singInUseCase.call(usr);
      final userId = await getUserIdUSecase.call();
      errorOrmessage.fold(
          (error) => IsSingOutstate(), (_) => IsSingInState(userId: userId));
    } catch (_) {
      emit(IsSingOutstate());
    }
  }

  Future<void> singOut() async {
    try {
      await singOutUseCase.call();
      emit(IsSingOutstate());
    } catch (_) {
      emit(IsSingOutstate());
    }
  }
}
