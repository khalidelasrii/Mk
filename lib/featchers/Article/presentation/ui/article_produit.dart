import 'dart:js';

import 'package:flutter/material.dart';

class ArticleProduit extends StatelessWidget {
  const ArticleProduit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildbody(),
    );
  }
}

buildbody() {
  return StatefulBuilder(builder: ((context, setState) {
    return Expanded(
        child: Container(
      color: Colors.amber,
    ));
  }));
}
