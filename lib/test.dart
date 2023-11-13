import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'core/Widgets/appbar_welcom.dart';

class Notificatintest extends StatefulWidget {
  const Notificatintest({Key? key}) : super(key: key);

  @override
  State<Notificatintest> createState() => _NotificatintestState();
}

class _NotificatintestState extends State<Notificatintest> {
  User? user;
  int notificationCount = 0;
  List<String> notificationEmails = [];

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? usr) {
      setState(() {
        user = usr;
      });
    });

    FirebaseFirestore.instance
        .collection('Descusion')
        .doc("khalidelasri@gmail.com")
        .collection("khalidelasri@gmail.com")
        .snapshots()
        .listen((QuerySnapshot event) {
      setState(() {
        notificationCount = event.size;
        notificationEmails =
            event.docs.map((e) => e['email'] as String).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          AppbarWelcom().appBarWidget(context, user),
          Center(
            child: Text('${notificationCount}'),
          ),
          // Utilisez la liste `notificationEmails` pour afficher les détails de chaque notification.
          // Par exemple, vous pouvez utiliser ListView.builder pour afficher la liste des emails.
          Expanded(
            child: ListView.builder(
              itemCount: notificationEmails.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notificationEmails[index]),
                  // Ajoutez d'autres éléments de la notification ici.
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
