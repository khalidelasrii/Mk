import 'package:equatable/equatable.dart';

class WelcomeArticle extends Equatable {
  final String userId;
  final String name;
  final String prixArticle;
  final String article;
  final String imageUrl;
  final String id;
  final String email;
  final String type;

  const WelcomeArticle(
      {required this.userId,
      required this.type,
      required this.name,
      required this.prixArticle,
      required this.article,
      required this.id,
      required this.imageUrl,
      required this.email});

  @override
  List<Object?> get props => [
        name,
        prixArticle,
        article,
        type,
      ];
}
