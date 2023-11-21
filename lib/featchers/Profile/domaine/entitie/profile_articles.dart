import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class ProfleArticle extends Equatable {
  final String userId;
  final String id;
  final String article;
  final String name;
  final String prix;
  final String email;
  final Uint8List? selectedImageInBytes;
  final String? articleUrl;
  final String type;

  const ProfleArticle(
      {required this.userId,
      required this.type,
      this.articleUrl,
      this.selectedImageInBytes,
      required this.email,
      required this.article,
      required this.name,
      required this.prix,
      required this.id});

  @override
  List<Object?> get props => [
        article,
        name,
        prix,
        id,
        article,
        name,
        email,
        selectedImageInBytes,
      ];
}
