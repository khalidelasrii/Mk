// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/core/messages.dart';
import 'package:mk/featchers/posts/domain/use_case/add_article_use_case.dart';
import 'package:mk/featchers/posts/domain/use_case/dellet_article_use_case.dart';
import 'package:mk/featchers/posts/domain/use_case/update_article_use_case.dart';

import '../../../../../core/errure/faillure.dart';
import '../../../domain/entitie/article.dart';

part 'addordeletorupdate_event.dart';
part 'addordeletorupdate_state.dart';

class AddordeletorupdateBloc
    extends Bloc<AddordeletorupdateEvent, AddordeletorupdateState> {
  final AddArticleUseCase addArticle;
  final DelletArticleUseCase delletArticle;
  final UpdateArticleUseCase updateArticle;
  AddordeletorupdateBloc(
      {required this.addArticle,
      required this.delletArticle,
      required this.updateArticle})
      : super(AddordeletorupdateInitial()) {
    on<AddordeletorupdateEvent>((event, emit) async {
      if (event is AddArticleEvent) {
        if (event.article.article == "" ||
            event.article.name == "" ||
            event.article.prix == 0) {
          emit(const ErrorAddDeleteUpdateState(
              message: 'Remplire tout les champ'));
        } else {
          final faillureOrDoneMessage = await addArticle(event.article);

          faillureOrDoneMessage.fold((faillure) {
            emit(ErrorAddDeleteUpdateState(
                message: _mapFailureTomessage(faillure)));
          }, (_) {
            emit(
                const ErrorAddDeleteUpdateState(message: ADD_SUCCESS_MESSAGES));
          });
        }
      } else if (event is DelletArticleEvent) {
        emit(LodingAddDeleteUpdateArticleState());
        final faillureOrDoneMessage = await delletArticle(event.articlId);

        faillureOrDoneMessage.fold((faillure) {
          emit(ErrorAddDeleteUpdateState(
              message: _mapFailureTomessage(faillure)));
        }, (_) {
          emit(
              const ErrorAddDeleteUpdateState(message: DELET_SUCCESS_MESSAGES));
        });
        /////
      } else if (event is UpdatArticleEvent) {
        emit(LodingAddDeleteUpdateArticleState());
        final faillureOrDoneMessage = await updateArticle(event.article);

        faillureOrDoneMessage.fold((faillure) {
          emit(ErrorAddDeleteUpdateState(
              message: _mapFailureTomessage(faillure)));
        }, (_) {
          emit(
              const ErrorAddDeleteUpdateState(message: UPDAT_SUCCESS_MESSAGES));
        });
      }
    });
  }

  String _mapFailureTomessage(Faillure faillure) {
    switch (faillure.runtimeType) {
      case ServerFailure:
        return 'Server Faillure ,Plais try again later';
      default:
        return 'Unexpected error, please try again later';
    }
  }
}
