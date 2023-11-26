import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/Profile/domaine/use_case/get_autre_profile_use_case.dart';

import '../../../domaine/entitie/profile_user.dart';

part 'get_pofile_state.dart';

class GetPofileCubit extends Cubit<GetPofileState> {
  GetAutreProfileUseCase getAutreProfileUseCase;
  GetPofileCubit({required this.getAutreProfileUseCase})
      : super(GetPofileInitial());

  getProfileEvent(ProfileUser user) async {
    final profileorfaillure = await getAutreProfileUseCase(user);

    profileorfaillure.fold((l) {
      emit(const ErrorProfileState(message: "try to Relod Page"));
    }, (r) {
      emit(LodidAutreProfileState(articles: r));
    });
  }
}
