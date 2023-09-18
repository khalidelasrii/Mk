import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/welcome_screen/domain/entitie/welcome_article.dart';
import 'package:mk/featchers/welcome_screen/domain/use_case/get_all_welcome_article_use_case.dart';

part 'adoor_articles_state.dart';

class AdoorArticlesCubit extends Cubit<AdoorArticlesState> {
  GetAllWelcomeArticleUseCase getAllWelcomeArticleUseCase;
  AdoorArticlesCubit({required this.getAllWelcomeArticleUseCase})
      : super(AdoorArticlesInitial());

  adoorArticlesloadingEvent() async {
    emit(LodingAdoorArticlesState());
    final addrarticlesOrfaillur = await getAllWelcomeArticleUseCase();
    addrarticlesOrfaillur.fold((_) {
      emit(const ErrorLodingAdoorArticleState(message: 'try to restart boton'));
    }, (listArticle) {
      emit(LodidAdorArticlesState(articles: listArticle));
    });
  }
}
