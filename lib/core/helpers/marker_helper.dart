import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locations_work/core/utils/icon_manager.dart';
import 'package:locations_work/modules/google_map/models/my_order_model.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart' as intel;
import 'package:easy_localization/easy_localization.dart' as local;
import 'package:google_fonts/google_fonts.dart';

class MarkerHelper {
  static Future<BitmapDescriptor> getMarkerIcon(Size size, Orders order) async {
    DateTime dateNow = DateTime.parse(order.date!).toLocal();
    bool isLiteOrder = order.subTitle == local.tr('lite');

    Color chooseColor(DateTime date) {
      if (isLiteOrder) {
        return Colors.orange;
      } else {
        if (date.day == DateTime.now().day) {
          return Colors.red;
        } else {
          return Colors.green;
        }
      }
    }

    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    // Draw outer circle
    final double outerRadius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final Paint outerCirclePaint = Paint()
      ..color = chooseColor(dateNow).withOpacity(0.3);
    canvas.drawCircle(center, outerRadius, outerCirclePaint);

    // Draw inner circle
    final double innerRadius = size.width / 2.7;
    final Paint innerCirclePaint = Paint()..color = chooseColor(dateNow);
    canvas.drawCircle(center, innerRadius, innerCirclePaint);

    if (isLiteOrder) {
      var fromTime = DateTime.parse(order.date!).toLocal();
      var endTime =
      DateTime.parse(order.date!).toLocal().add(const Duration(hours: 2));
      String formattedTime = intel.DateFormat(
        'HH',
      ).format(fromTime);
      String formattedEndTime = intel.DateFormat(
        'HH',
      ).format(endTime);
      // Draw text in the center of the inner circle
      final TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: '$formattedTime:$formattedEndTime',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: size.width * 0.16),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      final Offset textOffset = Offset(
        center.dx - textPainter.width / 2,
        center.dy - textPainter.height / 2,
      );
      textPainter.paint(canvas, textOffset);
    } else {
      // Draw icon in the center of the inner circle
      final double iconSize = size.width * 0.38;
      final ui.Image iconImage = await iconToImage(MyMapIcons.car, iconSize);
      final Rect iconRect = Rect.fromCenter(
        center: center,
        width: iconSize,
        height: iconSize,
      );
      canvas.drawImageRect(
        iconImage,
        Rect.fromLTRB(0, 0, iconSize, iconSize),
        iconRect,
        Paint(),
      );
    }

    // Convert canvas to bitmap
    final ui.Image markerAsImage = await pictureRecorder
        .endRecording()
        .toImage(size.width.toInt(), size.height.toInt());
    final ByteData? byteData =
    await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List uint8List = byteData!.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(uint8List);
  }

  static Future<ui.Image> iconToImage(IconData iconData, double size) async {
    final textSpan = TextSpan(
      text: String.fromCharCode(iconData.codePoint),
      style: TextStyle(
        fontFamily: iconData.fontFamily,
        fontSize: size,
        color: Colors.white,
      ),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    textPainter.paint(canvas, Offset.zero);
    final picture = recorder.endRecording();
    final image = await picture.toImage(
      textPainter.width.toInt(),
      textPainter.height.toInt(),
    );
    return image;
  }
}