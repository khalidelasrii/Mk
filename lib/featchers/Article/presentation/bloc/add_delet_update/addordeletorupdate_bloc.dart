// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/core/messages.dart';
import 'package:mk/featchers/Article/domain/use_case/add_article_use_case.dart';
import 'package:mk/featchers/Article/domain/use_case/dellet_article_use_case.dart';
import 'package:mk/featchers/Article/domain/use_case/update_article_use_case.dart';

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
        final faillureOrDoneMessage = await addArticle(event.article);
        emit(_eitherDoneMessageOrErrorState(
            faillureOrDoneMessage, ADD_SUCCESS_MESSAGES));
      } else if (event is DelletArticleEvent) {
        emit(LodingAddDeleteUpdateArticleState());
        final faillureOrDoneMessage = await delletArticle(event.articlId);
        emit(_eitherDoneMessageOrErrorState(
            faillureOrDoneMessage, DELET_SUCCESS_MESSAGES));
      } else if (event is UpdatArticleEvent) {
        emit(LodingAddDeleteUpdateArticleState());

        final faillureOrDoneMessage = await updateArticle(event.article);

        emit(_eitherDoneMessageOrErrorState(
            faillureOrDoneMessage, UPDAT_SUCCESS_MESSAGES));
      }
    });
  }

  AddordeletorupdateState _eitherDoneMessageOrErrorState(
      Either<Faillure, Unit> either, String message) {
    return either.fold(
        (faillure) =>
            ErrorAddDeleteUpdateState(message: _mapFailureTomessage(faillure)),
        (_) => MessageAddDeleteUpdatePostState(message: message));
  }

  String _mapFailureTomessage(Faillure faillure) {
    switch (faillure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
