// ignore: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/Article/domain/use_case/add_article_use_case.dart';
import 'package:mk/featchers/Article/domain/use_case/add_like_use_case.dart';
import 'package:mk/featchers/Article/domain/use_case/dellet_article_use_case.dart';
import 'package:mk/featchers/Article/domain/use_case/update_article_use_case.dart';

import '../../../../../core/const_widget/messages.dart';
import '../../../../../core/errure/faillure.dart';
import '../../../domain/entitie/article.dart';

part 'addordeletorupdate_event.dart';
part 'addordeletorupdate_state.dart';

class AddordeletorupdateBloc
    extends Bloc<AddordeletorupdateEvent, AddordeletorupdateState> {
  final AddArticleUseCase addArticle;
  final DelletArticleUseCase delletArticle;
  final UpdateArticleUseCase updateArticle;
  final AddLikeUseCase addLikeUseCase;
  AddordeletorupdateBloc(
      {required this.addLikeUseCase,
      required this.addArticle,
      required this.delletArticle,
      required this.updateArticle})
      : super(AddordeletorupdateInitial()) {
    on<AddordeletorupdateEvent>((event, emit) async {
      if (event is AddArticleEvent) {
        Either<Faillure, Unit> faillureOrDoneMessage =
            await addArticle(event.article);

        faillureOrDoneMessage.fold(
          (faillure) {
            emit(const ErrorAddDeleteUpdateState(
                message: SERVER_FAILURE_MESSAGE));
          },
          (_) => emit(
              const MessageAddDeleteUpdatePostState(message: 'Add Seccess')),
        );
      } else if (event is DelletArticleEvent) {
        emit(LodingAddDeleteUpdateArticleState());
        final faillureOrDoneMessage =
            await delletArticle(event.collectionId, event.articlId);

        faillureOrDoneMessage.fold(
          (faillure) {
            emit(const ErrorAddDeleteUpdateState(
                message: SERVER_FAILURE_MESSAGE));
          },
          (_) => emit(const MessageAddDeleteUpdatePostState(
              message: DELET_SUCCESS_MESSAGES)),
        );
      } else if (event is UpdatArticleEvent) {
        emit(LodingAddDeleteUpdateArticleState());

        final faillureOrDoneMessage = await updateArticle(event.article);

        faillureOrDoneMessage.fold(
          (faillure) {
            emit(const ErrorAddDeleteUpdateState(
                message: SERVER_FAILURE_MESSAGE));
          },
          (_) => emit(const MessageAddDeleteUpdatePostState(
              message: UPDAT_SUCCESS_MESSAGES)),
        );
      } else if (event is AddLikeEvent) {
        await addLikeUseCase(event.article);
      }
    });
  }
}
