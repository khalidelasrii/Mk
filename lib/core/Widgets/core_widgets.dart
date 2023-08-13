import 'package:flutter/material.dart';

CircularProgressIndicator lowdingWidget() {
  return const CircularProgressIndicator();
}

class LowdingWidget extends StatelessWidget {
  const LowdingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
            height: 40,
            child: CircularProgressIndicator(
              color: Colors.amber,
            )),
      ),
    );
  }
}

// MEssage display

class MessageDisplay extends StatelessWidget {
  const MessageDisplay({super.key, required this.color, required this.message});
  final String message;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SnackBar(
        content: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        child: Text(
          message,
          style: TextStyle(color: color),
        ),
      ),
    ));
  }
}
