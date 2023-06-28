import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Debug borders draws outline for child widget.
///
/// If [showDimensions] is true, it will draw dimensions of child widget.
class DebugBorder extends StatefulWidget {
  final Widget child;
  final Color color;
  final bool showDimensions;

  const DebugBorder({
    Key? key,
    required this.child,
    this.showDimensions = false,
    this.color = Colors.red,
  }) : super(key: key);

  @override
  State<DebugBorder> createState() => _DebugBorderState();
}

class _DebugBorderState extends State<DebugBorder> {
  final GlobalKey _key = GlobalKey();
  Size? childSize;

  @override
  Widget build(BuildContext context) {
    if (widget.showDimensions) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (this.childSize != _key.currentContext?.size) {
          setState(() => this.childSize = _key.currentContext?.size);
        }
      });
    }

    final borderedChild = DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.color,
          width: 1,
        ),
      ),
      child: KeyedSubtree(
        key: _key,
        child: widget.child,
      ),
    );

    if (!widget.showDimensions) return borderedChild;

    final childSize = this.childSize;

    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.passthrough,
      children: [
        borderedChild,
        if (childSize != null && widget.showDimensions) ...[
          if (childSize.width != 0)
            Positioned(
              top: -9,
              child: SizedBox(
                width: childSize.width,
                child: Center(
                  child: buildDimensionText(childSize.width),
                ),
              ),
            ),
          if (childSize.height != 0)
            Positioned(
              left: childSize.width - 9,
              child: RotatedBox(
                quarterTurns: 1,
                child: SizedBox(
                  width: childSize.height,
                  child: Center(
                    child: buildDimensionText(childSize.height),
                  ),
                ),
              ),
            ),
        ],
      ],
    );
  }

  Widget buildDimensionText(double dimension) {
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
        child: Text(
          NumberFormat.decimalPattern().format(dimension),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: widget.color,
            fontSize: 12,
          ),
          textHeightBehavior: const TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: false,
          ),
        ),
      ),
    );
  }
}

extension DebugBorderExtension on Widget {
  Widget debugBorder({Key? key, Color color = Colors.red, bool showDimensions = false}) {
    return DebugBorder(
      key: key,
      color: color,
      showDimensions: showDimensions,
      child: this,
    );
  }

  Widget debugDimensions({Key? key, Color color = Colors.red}) {
    return debugBorder(key: key, color: color, showDimensions: true);
  }
}
