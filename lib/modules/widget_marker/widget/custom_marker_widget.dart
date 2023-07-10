import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomMarkerWidget extends StatelessWidget {
  final double price;

  const CustomMarkerWidget({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2))
                ],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: Colors.deepPurple.withOpacity(.8), width: 8)),
            child: Center(
              child: Text(
                price.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Transform.rotate(
            angle: math.pi,
            child: CustomPaint(
              painter: TrianglePainter(),
              child: const SizedBox(
                width: 15,
                height: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.deepPurple.withOpacity(.8)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
