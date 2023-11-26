import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/Profile/domaine/use_case/get_mes_articles_use_case.dart';

import '../../../domaine/entitie/profile_articles.dart';

part 'get_mes_article_state.dart';

class GetMesArticleCubit extends Cubit<GetMesArticleState> {
  GetMesArticlesUseCase getMesArticlesUseCase;
  GetMesArticleCubit({required this.getMesArticlesUseCase})
      : super(GetMesArticleInitial());
  getMesArticleEvent(ProfleArticle article) async {
    final articlesorfaillure = await getMesArticlesUseCase(article);

    articlesorfaillure.fold((l) {
      emit(const ErrorProfileState(message: "try to Relod Page"));
    }, (r) {
      emit(LodidArticleState(articles: r));
    });
  }
}
