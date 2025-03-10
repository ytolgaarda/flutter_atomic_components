import 'package:atomic_components/components/qr_scan/corner_painter/corner_painter.dart';
import 'package:flutter/material.dart';

class QRScannerOverlay extends StatelessWidget {
  final double overlaySize; // Kutu boyutu
  final double cornerLineLength; // Köşe çizgilerinin uzunluğu
  final double cornerLineThickness; // Köşe çizgilerinin kalınlığı
  final Widget? box;

  const QRScannerOverlay({
    super.key,
    this.overlaySize = 250.0,
    this.cornerLineLength = 20.0,
    this.cornerLineThickness = 4.0,
    this.box,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: overlaySize,
        height: overlaySize,
        child: Stack(
          children: [
            // Köşe çizgileri
            _buildCornerLines(Alignment.topLeft, context),
            _buildCornerLines(Alignment.topRight, context),
            _buildCornerLines(Alignment.bottomLeft, context),
            _buildCornerLines(Alignment.bottomRight, context),
            // Kutu çerçevesi
            box ?? SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget _buildCornerLines(Alignment alignment, BuildContext context) {
    return Align(
      alignment: alignment,
      child: SizedBox(
        width: cornerLineLength,
        height: cornerLineLength,
        child: CustomPaint(
          painter: QRCornerLinePainter(
            color: Colors.blue,
            thickness: cornerLineThickness,
            alignment: alignment,
          ),
        ),
      ),
    );
  }
}
