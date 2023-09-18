import 'package:equatable/equatable.dart';

class WelcomeArticle extends Equatable {
  final int typearticle;
  final String name;
  final String prixArticle;
  final String article;
  final String imageUrl;
  final String id;
  final String email;

  const WelcomeArticle(
      {required this.typearticle,
      required this.name,
      required this.prixArticle,
      required this.article,
      required this.id,
      required this.imageUrl,
      required this.email});

  @override
  List<Object?> get props => [typearticle, name, prixArticle, article];
}
