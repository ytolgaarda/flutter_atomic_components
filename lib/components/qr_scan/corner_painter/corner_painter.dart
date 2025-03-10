import 'package:flutter/rendering.dart';

class QRCornerLinePainter extends CustomPainter {
  final Color color;
  final double thickness;
  final Alignment alignment;

  QRCornerLinePainter({
    required this.color,
    required this.thickness,
    required this.alignment,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    if (alignment == Alignment.topLeft) {
      canvas.drawLine(Offset(0, 0), Offset(0, size.height), paint);
      canvas.drawLine(Offset(0, 0), Offset(size.width, 0), paint);
    } else if (alignment == Alignment.topRight) {
      canvas.drawLine(Offset(size.width, 0), Offset(0, 0), paint);
      canvas.drawLine(
          Offset(size.width, 0), Offset(size.width, size.height), paint);
    } else if (alignment == Alignment.bottomLeft) {
      canvas.drawLine(Offset(0, size.height), Offset(0, 0), paint);
      canvas.drawLine(
          Offset(0, size.height), Offset(size.width, size.height), paint);
    } else if (alignment == Alignment.bottomRight) {
      canvas.drawLine(
          Offset(size.width, size.height), Offset(0, size.height), paint);
      canvas.drawLine(
          Offset(size.width, size.height), Offset(size.width, 0), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
