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
                    color: Colors.deepPurple.withOpacity(.3), width: 8)),
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
            angle: math.pi/2,
            child: Icon(Icons.play_arrow_rounded,
                size: 50, color: Colors.deepPurple.withOpacity(.3),
            ),
          )
        ],
      ),
    );
  }
}
