//! Articles

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../page/profile_screen.dart';

class MesArticlesDeProfile extends StatelessWidget {
  const MesArticlesDeProfile({super.key, required this.user});
  final User? user;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          constraints: const BoxConstraints(maxHeight: 1000, maxWidth: 1000),
          color: mygreen,
          child: const Center(
            child: Text("Mes Articles"),
          )),
    );
  }
}
