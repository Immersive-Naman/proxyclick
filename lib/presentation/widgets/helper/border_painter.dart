import 'package:flutter/material.dart';

class BorderPainter extends CustomPainter {
  final double topLeftRadius;
  final double bottomRightRadius;
  final double strokeLength;

  BorderPainter({
    required this.topLeftRadius,
    required this.bottomRightRadius,
    required this.strokeLength,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    Path path = Path();

    // Top-left corner with extended strokes
    path.moveTo(topLeftRadius + strokeLength, 0); // Start before the curve
    path.lineTo(topLeftRadius, 0); // Horizontal stroke
    path.quadraticBezierTo(0, 0, 0, topLeftRadius); // Rounded corner
    path.lineTo(0, topLeftRadius + strokeLength); // Vertical stroke

    // Bottom-right corner with extended strokes
    path.moveTo(
        size.width,
        size.height -
            bottomRightRadius -
            strokeLength); // Start above the curve
    path.lineTo(size.width, size.height - bottomRightRadius); // Vertical stroke
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - bottomRightRadius,
      size.height,
    ); // Rounded corner
    path.lineTo(size.width - bottomRightRadius - strokeLength,
        size.height); // Horizontal stroke

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
