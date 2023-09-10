import 'package:flutter/material.dart';

class CirclePainter extends StatefulWidget {
  @override
  _CirclePainterState createState() => _CirclePainterState();
}

class _CirclePainterState extends State<CirclePainter> {
  List<Offset> points = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          points.add(details.localPosition);
        });
      },
      child: CustomPaint(
        painter: CircleCustomPainter(points),
        size: Size.infinite,
      ),
    );
  }
}

class CircleCustomPainter extends CustomPainter {
  final List<Offset> points;
  CircleCustomPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    for (var point in points) {
      canvas.drawCircle(point, 20.0, paint); // Dessine un cercle de rayon 20.0
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
