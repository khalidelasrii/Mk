import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:mk/featchers/welcome_screen/domain/use_case/get_search_results_use_case.dart';

part 'recherch_state.dart';

class RecherchCubit extends Cubit<RecherchState> {
  GetSearchResultsUseCase getSearchResultsUseCase;
  RecherchCubit({required this.getSearchResultsUseCase})
      : super(RecherchInitial());

  closeBoxRecherchEvent() {
    emit(RecherchInitial());
  }

  recherchStatEvent(String value) {
    emit(RecherchStartstate(getSearchResultsUseCase(value)));
  }
}
