import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mk/featchers/Profile/domaine/entitie/profile_user.dart';

class ProfleArticle extends ProfileUser {
  final String articleId;
  final String? article;
  final String articleType;
  final String prix;
  final Uint8List? selectedImageInBytes;
  final String? articleUrl;
  final Timestamp? date;

  const ProfleArticle(
      {required this.articleType,
      this.articleUrl,
      this.selectedImageInBytes,
      required this.article,
      required this.prix,
      required this.articleId,
      required super.email,
      required super.name,
      required super.uid,
      this.date});

  @override
  List<Object?> get props => [
        prix,
        articleId,
        article,
        name,
        selectedImageInBytes,
        articleType,
        articleUrl,
      ];
}
