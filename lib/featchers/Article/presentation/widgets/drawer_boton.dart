import 'package:flutter/material.dart';

Column DrawerBoton() {
  return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
    Padding(
        padding: const EdgeInsets.only(right: 5.0, bottom: 5),
        child: ElevatedButton(onPressed: () {}, child: const Text('data')))
  ]);
}
