import 'package:flutter/material.dart';

thertContainer() {
  return Expanded(
    child: Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      color: Colors.orange,
      height: double.infinity,
    ),
  );
}
