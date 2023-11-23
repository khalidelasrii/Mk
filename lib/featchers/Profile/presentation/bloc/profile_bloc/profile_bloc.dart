import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/Profile/domaine/entitie/profile_user.dart';
import 'package:mk/featchers/Profile/domaine/use_case/get_mes_articles_use_case.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  GetMesArticlesUseCase getMesArticlesUseCase;
  ProfileBloc({required this.getMesArticlesUseCase}) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is GetMesArticlesEvent) {
        final articleOrFaillure =
            await getMesArticlesUseCase(event.articletype);
        articleOrFaillure.fold((_) {
          emit(const ErrorProfileState(
              message:
                  "Error to loded article try refrech page or chik your internet"));
        }, (articles) {
          emit(ArticleLodedState(articles: articles));
        });
      }
    });
  }
}
