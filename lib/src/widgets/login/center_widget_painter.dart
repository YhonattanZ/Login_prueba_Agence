import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prueba_agence_br/src/common/constants.dart';

class CenterWidgetPainter extends CustomPainter {
  Path path;

  CenterWidgetPainter({required this.path});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..imageFilter = ImageFilter.blur(sigmaX: 20, sigmaY: 20)
      ..color = kSecondaryColor;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CenterWidgetPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CenterWidgetPainter oldDelegate) => false;
}
