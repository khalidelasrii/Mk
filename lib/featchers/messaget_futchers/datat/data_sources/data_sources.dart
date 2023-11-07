import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mk/featchers/messaget_futchers/datat/models/model_message.dart';

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
        .orderBy("dateTime", descending: true)
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
        .add(ModelMessage(
          message: message.message,
          emailSender: currentUser.email,
          emailRecuper: message.emailRecuper,
          descusionId: conversationId,
          dateTime: FieldValue.serverTimestamp(),
        ).toMap());
    //! en deuxieme on ajoute le message a la collection de second itulisateur
    _firestore
        .collection("Descusion")
        .doc(message.emailRecuper)
        .collection(message.emailRecuper!)
        .doc(conversationId)
        .collection("Messages")
        .add(ModelMessage(
          message: message.message,
          emailSender: currentUser.email,
          emailRecuper: message.emailRecuper,
          descusionId: conversationId,
          dateTime: FieldValue.serverTimestamp(),
        ).toMap());
  }

  String _generateUniqueConversationId(String userId1, String userId2) {
    final List<String> users = [userId1, userId2];
    users.sort();
    return users.join("_");
  }
}
