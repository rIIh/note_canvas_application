import 'package:flutter/material.dart';
import 'package:note_canvas_application/features/core/canvas/presentation/widgets/inline_painter.dart';

class PatternPainter extends StatelessWidget {
  final double size;
  final Offset offset;
  final Color color;
  final double radius;

  const PatternPainter({
    super.key,
    this.size = 20,
    this.offset = Offset.zero,
    this.color = Colors.white,
    this.radius = 1,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: InlinePainter(
        brush: Paint()..color = color,
        painter: (paint, canvas, rect) {
          final delta = offset % size;

          final xCount = (rect.size.width) / size;
          final yCount = (rect.size.height) / size;

          for (var x = .0; x < xCount; x++) {
            for (var y = .0; y < yCount; y++) {
              canvas.drawCircle(
                Offset((x / xCount) * rect.size.width + delta.dx, (y / yCount) * rect.size.height + delta.dy),
                radius,
                paint,
              );
            }
          }
        },
      ),
    );
  }
}
