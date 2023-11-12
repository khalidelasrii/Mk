import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Notificatintest extends StatefulWidget {
  const Notificatintest({super.key});

  @override
  State<Notificatintest> createState() => _NotificatintestState();
}

class _NotificatintestState extends State<Notificatintest> {
  @override
  Widget build(BuildContext context) {
    int x = 0;
    notificationMessages() async {
      FirebaseFirestore.instance
          .collection('Descusion')
          .doc("khalidelasri@gmail.com")
          .collection("khalidelasri@gmail.com")
          .snapshots()
          .listen((event) {
        final xx = event.docs.map((ee) {
          final sub = ee.data();
          return sub["email"];
        }).toString();
        setState(() {
          x = xx.length;
        });
      });
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Text('${x}'),
      ),
    );
  }
}
