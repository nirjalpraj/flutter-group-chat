import 'package:flutter/material.dart';

class Date_Display extends StatelessWidget {
  const Date_Display({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Align(
          // alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomPaint(
                size: const Size(80, 1),
                painter: MyPainter(),
              ),
              const SizedBox(width: 10),
              const Text(
                'Apr 08 2024',
                style: TextStyle(fontSize: 14.0),
              ),
              const SizedBox(width: 10),
              CustomPaint(
                size: const Size(80, 1),
                painter: MyPainter(),
              ),
            ],
          ),
        ));
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 0.75
      ..strokeCap = StrokeCap.round;

    Offset startPoint = Offset(0, size.height / 2);
    Offset endPoint = Offset(size.width, size.height / 2);
    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
