import 'package:flutter/material.dart';

class CerclulareLodingWidget extends StatelessWidget {
  const CerclulareLodingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
          height: 40,
          child: CircularProgressIndicator(
            color: Colors.green,
          )),
    );
  }
}
