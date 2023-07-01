import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
// import 'dart:ui' as ui;

class ContainersScreen extends StatelessWidget {
  const ContainersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Container(
              child: CustomPaint(
        size: Size(400,(400*0.625).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
        painter: RPSCustomPainter(),
      ),
            ),
            // RoundedCornerShape(),
            NonSymmetricShape(),
            Center(
              child: DottedBorder(
                padding: const EdgeInsets.all(7),
                radius: const Radius.circular(7),
                borderType: BorderType.RRect,
                strokeWidth: 1.4,
                dashPattern: const [6,6],
                child: const Text('\t\t\n\nFrom Dotted Border Library\t \t\n\n'),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;


    Path path_0 = Path();
    path_0.moveTo(size.width*0.3125000,size.height*0.3020000);
    path_0.lineTo(size.width*0.5637500,size.height*0.3040000);
    path_0.lineTo(size.width*0.5625000,size.height*0.5000000);
    path_0.lineTo(size.width*0.3750000,size.height*0.5040000);
    path_0.lineTo(size.width*0.3125000,size.height*0.6000000);
    path_0.lineTo(size.width*0.3125000,size.height*0.3020000);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);


    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;



    canvas.drawPath(path_0, paint_stroke_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class RoundedCornerShape extends StatelessWidget {
  const RoundedCornerShape({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RoundedCornerPainter(),
      child: Container(
        height: 200, // Replace with your desired container height
      ),
    );
  }
}

class RoundedCornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue // Replace with your desired shape color
      ..style = PaintingStyle.fill;

    final borderRadius = BorderRadius.circular(20.0); // Adjust the corner radius as needed

    final rect = Rect.fromLTRB(0, 0, size.width, size.height);

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        rect,
        topLeft: borderRadius.topLeft,
        topRight: borderRadius.topRight,
        bottomLeft: borderRadius.bottomLeft,
        bottomRight: borderRadius.bottomRight,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(RoundedCornerPainter oldDelegate) => false;
}

class NonSymmetricShape extends StatelessWidget {
  const NonSymmetricShape({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: NonSymmetricShapePainter(),
      child: Container(
        height: 200, // Replace with your desired container height
      ),
    );
  }
}

class NonSymmetricShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue // Replace with your desired shape color
      ..style = PaintingStyle.fill;

    final path = Path();

    // Define the shape of the path
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width*.09, size.height);
    path.lineTo(0, size.height * 0);
    path.close();

    final borderRadius = BorderRadius.circular(20.0); // Adjust the corner radius as needed

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTRB(0, 0, size.width, size.height),
        topLeft: borderRadius.topLeft,
        topRight: borderRadius.topRight,
        bottomLeft: borderRadius.bottomLeft,
        bottomRight: borderRadius.bottomRight,
      ),
      paint,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(NonSymmetricShapePainter oldPainter) => false;
}



