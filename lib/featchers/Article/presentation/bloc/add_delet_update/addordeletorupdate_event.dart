part of 'addordeletorupdate_bloc.dart';

sealed class AddordeletorupdateEvent extends Equatable {
  const AddordeletorupdateEvent();

  @override
  List<Object> get props => [];
}

class AddArticleEvent extends AddordeletorupdateEvent {
  final Article article;

  const AddArticleEvent({required this.article});
  @override
  List<Object> get props => [article];
}

class DelletArticleEvent extends AddordeletorupdateEvent {
  final String articlId, collectionId;

  const DelletArticleEvent(
      {required this.collectionId, required this.articlId});
  @override
  List<Object> get props => [articlId, collectionId];
}

class UpdatArticleEvent extends AddordeletorupdateEvent {
  final Article article;

  const UpdatArticleEvent({required this.article});
  @override
  List<Object> get props => [article];
}
