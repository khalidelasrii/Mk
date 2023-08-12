import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String id;
  final String article;
  final String name;
  final double prix;

  Article(
      {required this.id,
      required this.article,
      required this.name,
      required this.prix});

  @override
  List<Object?> get props => [id, article, name, prix];
}
