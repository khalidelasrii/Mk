import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/welcome_screen/domain/use_case/get_users_usecase.dart';

import '../../../../Profile/domaine/entitie/profile_user.dart';

part 'users_welcome_screen_state.dart';

class UsersWelcomeScreenCubit extends Cubit<UsersWelcomeScreenState> {
  GetUsersUsecase getUsersUsecase;

  UsersWelcomeScreenCubit({required this.getUsersUsecase})
      : super(UsersWelcomeScreenInitial());

  getUsersEvent() async {
    final usersOrFaillure = await getUsersUsecase();
    usersOrFaillure.fold((faillure) {
      emit(UsersWelcomeScreenInitial());
    }, (users) {
      emit(LodidUsersWelcomeState(profiles: users));
    });
  }
}
