import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String id;
  final String article;
  final String name;
  final String prix;
  final String email;

  Article(
      {required this.email,
      required this.article,
      required this.name,
      required this.prix,
      required this.id});

  @override
  List<Object?> get props => [article, name, prix];
}
