import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mk/featchers/welcome_screen/data/models/welcome_article_model.dart';

abstract class WelcomeDataSource {
  Future<List<WelcomeArticleModel>> getAllArticle();
  Future<List<WelcomeArticleModel>> articlePartype(String collection);
  Future<Stream<QuerySnapshot>> getSearchResults(String query);
}

class WelcomeDataSourcesImpl implements WelcomeDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<WelcomeArticleModel> allArticles = [], articleParCategorie = [];
  List<String> collectionName = [
    'Forniture',
    'Livres',
    'Cartables',
    'Stylo',
    'Cartables',
    'Autres',
  ];
  @override
  Future<Stream<QuerySnapshot>> getSearchResults(String query) async {
    return FirebaseFirestore.instance
        .collection('ArticleSearche')
        .where('name', isGreaterThanOrEqualTo: query)
        .snapshots();
  }

  @override
  Future<List<WelcomeArticleModel>> getAllArticle() async {
    List<WelcomeArticleModel> allArticles = [];
    final articlesCollection = _firestore.collection('Articles');

    try {
      QuerySnapshot snapshot = await articlesCollection.get();
      for (QueryDocumentSnapshot documentSnapshot in snapshot.docs) {
        for (String collection in collectionName) {
          final subCollectionSnapshot = await articlesCollection
              .doc(documentSnapshot.id)
              .collection(collection)
              .get();

          final subCollectionArticles =
              subCollectionSnapshot.docs.map((subDoc) {
            final subArticleData = subDoc.data();

            return WelcomeArticleModel(
                userId: subArticleData['userId'] ?? "",
                type: subArticleData['type'],
                email: subArticleData['email'],
                article: subArticleData['article'],
                name: subArticleData['name'],
                prixArticle: subArticleData['prix'],
                id: subDoc.id,
                imageUrl: subArticleData['articleUrl']);
          }).toList();

          allArticles.addAll(subCollectionArticles);
        }
      }

      return allArticles;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<WelcomeArticleModel>> articlePartype(String collection) async {
    final articlesCollection = _firestore.collection('Articles');
    try {
      QuerySnapshot querySnapshot = await articlesCollection.get();
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        final subCollectionSnapshot = await articlesCollection
            .doc(documentSnapshot.id)
            .collection(collection)
            .get();

        final subCollectionArticles = subCollectionSnapshot.docs.map((docdoc) {
          final subArticleData = docdoc.data();
          return WelcomeArticleModel(
              userId: subArticleData['userId'],
              type: subArticleData['type'],
              email: subArticleData['email'],
              name: subArticleData['name'],
              prixArticle: subArticleData['prix'],
              article: subArticleData['article'],
              id: docdoc.id,
              imageUrl: subArticleData['articleUrl']);
        }).toList();
        articleParCategorie.addAll(subCollectionArticles);
      }
      return articleParCategorie;
    } catch (e) {
      return [];
    }
  }
}
