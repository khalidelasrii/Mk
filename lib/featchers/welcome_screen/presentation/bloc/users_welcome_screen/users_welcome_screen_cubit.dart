import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../Profile/domaine/entitie/profile_user.dart';

part 'users_welcome_screen_state.dart';

class UsersWelcomeScreenCubit extends Cubit<UsersWelcomeScreenState> {
  UsersWelcomeScreenCubit() : super(UsersWelcomeScreenInitial());
}
