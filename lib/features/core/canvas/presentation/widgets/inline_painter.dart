import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

typedef RepaintPredicate = bool Function();
typedef PainterDelegate = void Function(Paint paint, Canvas canvas, Rect rect);

/// A [CustomPainter] that allows you to paint on the canvas inline the widget tree.
class InlinePainter extends CustomPainter {
  final Paint brush;
  final PainterDelegate painter;
  final RepaintPredicate? shouldRepaintPredicate;

  const InlinePainter({
    required this.brush,
    required this.painter,
    RepaintPredicate? shouldRepaint,
  }) : shouldRepaintPredicate = shouldRepaint;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    canvas.save();
    painter(brush, canvas, rect);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return shouldRepaintPredicate?.call() ?? true;
  }
}
