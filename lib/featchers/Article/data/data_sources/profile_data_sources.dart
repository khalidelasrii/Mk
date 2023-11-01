import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mk/featchers/Article/data/models/message.dart';
import 'package:mk/featchers/Article/domain/entitie/article.dart';

abstract class ProfileDataSources {
  Future<List<Article>> getmesArticles();
  Future<void> sendMessage(Message message);
  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(String userRecuper);
  Stream<QuerySnapshot<Map<String, dynamic>>> getDescusion();
}

class ProfileDataSourcesImpl implements ProfileDataSources {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  List<String> collectionName = [
    'Forniture',
    'Livres',
    'Cartables',
    'Stylo',
    'Cartables',
    'Autres',
  ];
  final List<Article> articlesList = [];
  @override
  Future<List<Article>> getmesArticles() async {
    for (var collection in collectionName) {
      final querysnapshot = await _firestore
          .collection('Articles')
          .doc(_auth.currentUser!.email)
          .collection(collection)
          .get();
      final xx = querysnapshot.docs.map((alluser) {
        final data = alluser.data();
        final usrid = alluser.id;

        return Article(
            type: data['type'],
            email: data['email'],
            id: usrid,
            name: data['name'],
            prix: data['prix'],
            article: data['article'],
            articleUrl: data['articleUrl']);
      }).toList();
      articlesList.addAll(xx);
    }
    return articlesList;
  }

  @override
  Future<void> sendMessage(Message message) async {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      final collection = _firestore.collection("Descusion");

      // Créez un identifiant unique pour le document de conversation
      final conversationId = _generateUniqueConversationId(
          currentUser.uid, message.recupererEmail);

      // Ajoutez le message à la collection "Messages" de la conversation
      await collection.doc(conversationId).collection('Messages').add({
        "message": message.message,
        "senderEmail": currentUser.email,
        "timestamp": FieldValue.serverTimestamp(),
        "userId": currentUser.uid,
        "recipientEmail": message.recupererEmail,
      });
    }
  }

// Fonction pour générer un identifiant de conversation unique basé sur les deux utilisateurs
  String _generateUniqueConversationId(String userId1, String userId2) {
    // Vous pouvez trier les deux ID d'utilisateur et les concaténer pour créer un ID unique
    final List<String> users = [userId1, userId2];
    users.sort();
    return users.join("_");
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(String userRecuper) {
    final conversationId =
        _generateUniqueConversationId(_auth.currentUser!.uid, userRecuper);
    return _firestore
        .collection('Descusion')
        .doc(conversationId)
        .collection("Messages")
        .orderBy("timestamp",
            descending: false) // Vous pouvez trier les messages par horodatage
        .snapshots();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getDescusion() {
    return _firestore.collection("collectionPath").snapshots();
  }
}
