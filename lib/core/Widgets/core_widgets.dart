import 'package:flutter/material.dart';

class LowdingWidget extends StatelessWidget {
  const LowdingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
          height: 40,
          child: CircularProgressIndicator(
            color: Colors.amber,
          )),
    );
  }
}

// MEssage display

class MessageDisplay extends StatelessWidget {
  const MessageDisplay({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return SnackBar(
        content: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        child: Text(
          message,
          style: const TextStyle(color: Colors.red),
        ),
      ),
    ));
  }
}
