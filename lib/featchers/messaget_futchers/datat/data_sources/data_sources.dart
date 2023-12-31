import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mk/featchers/messaget_futchers/datat/models/model_message.dart';

import '../../domain/entitie/message.dart';

abstract class DataSourcesMessages {
  Future<void> sendMessage(Messages message);
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getMessages(
      String userRecuper);
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getDescusion();
  Future<void> messageVu(Messages message);
  void notificationMessages(String emailre, int nbr);
}

class DataSourcesMessagesImpl implements DataSourcesMessages {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  @override
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getDescusion() async {
    if (_auth.currentUser != null) {
      return _firestore
          .collection("Descusion")
          .doc(_auth.currentUser!.email)
          .collection(_auth.currentUser!.email!)
          .orderBy("dateTime", descending: true)
          .snapshots();
    } else {
      return _firestore.collection("Descusion").snapshots();
    }
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

    final messageid = Timestamp.now();

    //! en premier on ajout le message au premier itulisateur
    _firestore
        .collection("Descusion")
        .doc(currentUser.email)
        .collection(currentUser.email!)
        .doc(conversationId)
        .collection("Messages")
        .doc(messageid.toString())
        .set(ModelMessage(
                nbrvu: 0,
                vu: message.vu,
                message: message.message,
                emailSender: currentUser.email,
                emailRecuper: message.emailRecuper,
                descusionId: conversationId,
                dateTime: messageid)
            .toMap());
    //! en deuxieme on ajoute le message a la collection de second itulisateur
    _firestore
        .collection("Descusion")
        .doc(message.emailRecuper)
        .collection(message.emailRecuper!)
        .doc(conversationId)
        .collection("Messages")
        .doc(messageid.toString())
        .set(ModelMessage(
          nbrvu: 0,
          vu: message.vu,
          message: message.message,
          emailSender: currentUser.email,
          emailRecuper: message.emailRecuper,
          descusionId: conversationId,
          dateTime: messageid,
        ).toMap());
  }

  @override
  Future<void> messageVu(Messages message) {
    final conversationId = _generateUniqueConversationId(
        _auth.currentUser!.email!, message.emailSender!);
    _firestore
        .collection("Descusion")
        .doc(message.emailSender)
        .collection(message.emailSender!)
        .doc(conversationId)
        .collection("Messages")
        .doc(message.messageId)
        .set(ModelMessage(
          nbrvu: 0,
          vu: message.vu,
          message: message.message,
          emailSender: message.emailSender,
          emailRecuper: message.emailRecuper,
          descusionId: message.descusionId,
          dateTime: message.dateTime,
        ).toMap());

    _firestore
        .collection("Descusion")
        .doc(message.emailRecuper)
        .collection(message.emailRecuper!)
        .doc(conversationId)
        .collection("Messages")
        .doc(message.messageId)
        .set(ModelMessage(
          nbrvu: 0,
          vu: message.vu,
          message: message.message,
          emailSender: message.emailSender,
          emailRecuper: message.emailRecuper,
          descusionId: message.descusionId,
          dateTime: message.dateTime,
        ).toMap());
    return Future.value();
  }

  String _generateUniqueConversationId(String userId1, String userId2) {
    final List<String> users = [userId1, userId2];
    users.sort();
    return users.join("_");
  }

  @override
  void notificationMessages(String emailre, int nbr) async {
    final currentUser = _auth.currentUser;
    if (currentUser!.email != emailre) {
      final conversationId =
          _generateUniqueConversationId(currentUser.email!, emailre);
      _firestore
          .collection("Descusion")
          .doc(emailre)
          .collection(emailre)
          .doc(conversationId)
          .set({"email": currentUser.email, "nbr": nbr});

      _firestore
          .collection("Descusion")
          .doc(currentUser.email)
          .collection(currentUser.email!)
          .doc(conversationId)
          .set({"email": emailre, "nbr": 0});
    }

    return Future.value();
  }
}
