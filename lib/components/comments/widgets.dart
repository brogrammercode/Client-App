import 'package:flutter/material.dart';

class DottedBackgroundPainter extends CustomPainter {
  final Color dotColor;
  final double dotSpacing;
  final double dotRadius;

  DottedBackgroundPainter({
    required this.dotColor,
    this.dotSpacing = 32,
    this.dotRadius = 2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = dotColor;
    for (double y = 0; y < size.height; y += dotSpacing) {
      for (double x = 0; x < size.width; x += dotSpacing) {
        canvas.drawCircle(Offset(x, y), dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
