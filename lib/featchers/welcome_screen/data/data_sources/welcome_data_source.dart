import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mk/featchers/welcome_screen/data/models/welcome_article_model.dart';

abstract class WelcomeDataSource {
  Future<List<WelcomeArticleModel>> getAllArticle();
}

class WelcomeDataSourcesImpl implements WelcomeDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<WelcomeArticleModel>> getAllArticle() async {
    final querySnapshote = await _firestore.collection('ArticleAdor').get();
    return querySnapshote.docs.map((artcle) {
      final data = artcle.data();
      return WelcomeArticleModel(
        email: data['email'],
        typearticle: 1,
        name: data['name'],
        prixArticle: data['prix'],
        article: data['article'],
        id: data['id'],
        imageUrl: data['articleUrl'],
      );
    }).toList();
  }
}
