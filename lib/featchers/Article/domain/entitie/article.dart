import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String uid;
  final String articleId;
  final String article;
  final String name;
  final String prix;
  final String email;
  final Uint8List? selectedImageInBytes;
  final String? articleUrl;
  final String articleType;
  final Timestamp? date;
  final List? likers;

  const Article(
      {required this.uid,
      required this.articleType,
      this.date,
      this.articleUrl,
      this.selectedImageInBytes,
      required this.email,
      required this.article,
      required this.name,
      required this.prix,
      required this.articleId,
      this.likers});

  @override
  List<Object?> get props => [
        article,
        name,
        prix,
        articleId,
        article,
        name,
        email,
        selectedImageInBytes,
      ];
}
