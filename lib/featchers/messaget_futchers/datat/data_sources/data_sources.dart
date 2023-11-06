import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entitie/message.dart';

abstract class DataSourcesMessages {
  Future<void> sendMessage(Messages message);
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getMessages(
      String userRecuper);
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getDescusion();
}

class DataSourcesMessagesImpl implements DataSourcesMessages {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  @override
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getDescusion() async {
    return _firestore
        .collection("Descusion")
        .doc(_auth.currentUser!.email)
        .collection(_auth.currentUser!.email!)
        .snapshots();
  }

  @override
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getMessages(
      String userRecuper) async {
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
  Future<void> sendMessage(Messages message) async {
    final currentUser = _auth.currentUser;
    // Créez un identifiant unique pour le document de conversation
    final conversationId = _generateUniqueConversationId(
        currentUser!.email!, message.emailRecuper!);
    //! ecrer les champs de de descusion
    _firestore
        .collection("Descusion")
        .doc(currentUser.email)
        .collection(currentUser.email!)
        .doc(conversationId)
        .set({
      "email": message.emailRecuper,
    });
    _firestore
        .collection("Descusion")
        .doc(message.emailRecuper)
        .collection(message.emailRecuper!)
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
      "recipientEmail": message.emailRecuper,
    });
    //! en deuxieme on ajoute le message a la collection de second itulisateur
    _firestore
        .collection("Descusion")
        .doc(message.emailRecuper)
        .collection(message.emailRecuper!)
        .doc(conversationId)
        .collection("Messages")
        .add({
      "message": message.message,
      "senderEmail": currentUser.email,
      "timestamp": FieldValue.serverTimestamp(),
      "userId": currentUser.uid,
      "recipientEmail": message.emailRecuper,
    });
  }

  // Fonction pour générer un identifiant de conversation unique basé sur les deux utilisateurs
  String _generateUniqueConversationId(String userId1, String userId2) {
    // Vous pouvez trier les deux ID d'utilisateur et les concaténer pour créer un ID unique
    final List<String> users = [userId1, userId2];
    users.sort();
    return users.join("_");
  }
}
