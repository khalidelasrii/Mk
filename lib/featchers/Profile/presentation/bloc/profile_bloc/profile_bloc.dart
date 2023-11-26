import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/Profile/domaine/entitie/profile_user.dart';
import 'package:mk/featchers/Profile/domaine/use_case/get_autre_profile_use_case.dart';
import 'package:mk/featchers/Profile/domaine/use_case/get_mes_articles_use_case.dart';

import '../../../domaine/entitie/profile_articles.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  GetMesArticlesUseCase getMesArticlesUseCase;
  GetAutreProfileUseCase getAutreProfileUseCase;
  ProfileBloc(
      {required this.getMesArticlesUseCase,
      required this.getAutreProfileUseCase})
      : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is GetProfileEvent) {
        final articleOrFaillure = await getAutreProfileUseCase(event.user);
        articleOrFaillure.fold((articles) {
          emit(LodidAutreProfileState(
              profile: ProfileUser(email: "", name: "", uid: ""),
              articles: articles));
        }, (profile) {
          emit(LodidAutreProfileState(profile: profile, articles: null));
        });
      }
    });
  }
}
