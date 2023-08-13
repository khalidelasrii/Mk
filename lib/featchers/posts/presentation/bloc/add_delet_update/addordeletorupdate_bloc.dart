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
  final AddArticleUseCase addArticleUseCase;
  final DelletArticleUseCase delletArticleUseCase;
  final UpdateArticleUseCase updateArticleUseCase;
  AddordeletorupdateBloc(
      {required this.addArticleUseCase,
      required this.delletArticleUseCase,
      required this.updateArticleUseCase})
      : super(AddordeletorupdateInitial()) {
    on<AddordeletorupdateEvent>((event, emit) async {
      if (event is AddArticleEvent) {
        emit(LodingAddDeleteUpdateArticleState());
        final faillureOrDoneMessage = await addArticleUseCase(event.article);

        faillureOrDoneMessage.fold((faillure) {
          emit(ErrorAddDeleteUpdateState(
              message: _mapFailureTomessage(faillure)));
        }, (_) {
          emit(const ErrorAddDeleteUpdateState(message: ADD_SUCCESS_MESSAGES));
        });
      } else if (event is DelletArticleEvent) {
        emit(LodingAddDeleteUpdateArticleState());
        final faillureOrDoneMessage =
            await delletArticleUseCase(event.articlId);

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
        final faillureOrDoneMessage = await updateArticleUseCase(event.article);

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
