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
    // Créez un identifiant unique pour le document de conversation
    final conversationId = _generateUniqueConversationId(
        currentUser!.email!, message.recupererEmail);
    //! ecrer les champs de de descusion
    _firestore
        .collection("Descusion")
        .doc(currentUser.email)
        .collection(currentUser.email!)
        .doc(conversationId)
        .set({
      "email": message.recupererEmail,
    });
    _firestore
        .collection("Descusion")
        .doc(message.recupererEmail)
        .collection(message.recupererEmail)
        .doc(conversationId)
        .set({
      "email": currentUser.email,
    });

    //! en premier on ajout le message a ma collection
    _firestore
        .collection("Descusion")
        .doc(currentUser.email)
        .collection(currentUser.email!)
        .doc(conversationId)
        .collection("Messages")
        .add({
      "message": message.message,
      "senderEmail": currentUser.email,
      "timestamp": FieldValue.serverTimestamp(),
      "userId": currentUser.uid,
      "recipientEmail": message.recupererEmail,
    });
    //! en deuxieme on ajoute le message a la collection de second itulisateur
    _firestore
        .collection("Descusion")
        .doc(message.recupererEmail)
        .collection(message.recupererEmail)
        .doc(conversationId)
        .collection("Messages")
        .add({
      "message": message.message,
      "senderEmail": currentUser.email,
      "timestamp": FieldValue.serverTimestamp(),
      "userId": currentUser.uid,
      "recipientEmail": message.recupererEmail,
    });
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
        _generateUniqueConversationId(_auth.currentUser!.email!, userRecuper);
    return _firestore
        .collection('Descusion')
        .doc(_auth.currentUser!.email)
        .collection(_auth.currentUser!.email!)
        .doc(conversationId)
        .collection("Messages")
        .orderBy("timestamp", descending: true)
        .snapshots();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getDescusion() {
    return _firestore
        .collection("Descusion")
        .doc(_auth.currentUser!.email)
        .collection(_auth.currentUser!.email!)
        .snapshots();
  }
}
