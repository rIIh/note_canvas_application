import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note_canvas_application/features/core/canvas/presentation/widgets/draggable_canvas_item.dart';
import 'package:provider/provider.dart';

/// [ResizeHandleProvider] used to draw resize handle in child widget under [DraggableCanvasItem].
///
/// Because of no way to prioritize resize [GestureDetector] over draggable [GestureDetector],
/// we should place resize [GestureDetector] and visuals built by [buildHandle] separately.
mixin ResizeHandleProvider {
  static Widget tryWrap({required Widget child}) {
    return Builder(
      builder: (context) {
        final provider = context.watch<ResizeHandleProvider?>();
        if (provider == null) return child;

        return provider.wrap(context, child);
      },
    );
  }

  Positioned buildHandle(BuildContext context);

  Widget wrap(BuildContext context, Widget child) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.passthrough,
      children: [
        child,
        buildHandle(context),
      ],
    );
  }
}

class ResizableCanvasItem extends StatefulWidget {
  final Widget child;
  final VoidCallback? onHandleDoubleTap;
  final ValueChanged<Size> onSizeChanged;

  const ResizableCanvasItem({
    super.key,
    this.onHandleDoubleTap,
    required this.onSizeChanged,
    required this.child,
  });

  @override
  State<ResizableCanvasItem> createState() => _ResizableCanvasItemState();
}

class _ResizableCanvasItemState extends State<ResizableCanvasItem> with ResizeHandleProvider {
  Size? childSize;

  bool isResizing = false;
  double? editHeight;
  double? editWidth;

  @override
  Widget build(BuildContext context) {
    return Provider<ResizeHandleProvider>.value(
      value: this,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Builder(builder: (context) {
            if (!isResizing) {
              Future.microtask(() => childSize = context.size);
            }

            return ConstrainedBox(
              constraints: isResizing
                  ? BoxConstraints.tightFor(
                      width: editWidth,
                      height: editHeight,
                    )
                  : const BoxConstraints(),
              child: widget.child,
            );
          }),
          _wrapResizeHandleWidget(
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onDoubleTap: widget.onHandleDoubleTap,
              onScaleStart: (details) {
                if (details.pointerCount > 1) return;

                editWidth = childSize?.width;
                editHeight = childSize?.height ?? 500;
                setState(() => isResizing = true);
              },
              onScaleUpdate: (details) {
                if (!isResizing) return;

                setState(() {
                  final width = editWidth;
                  final height = editHeight;
                  if (width == null || height == null) return;

                  editWidth = width + details.focalPointDelta.dx;
                  editHeight = height + details.focalPointDelta.dy;
                });
              },
              onScaleEnd: (details) {
                if (!isResizing) return;

                final width = editWidth;
                final height = editHeight;
                if (width == null || height == null) return;

                widget.onSizeChanged(Size(width, height));

                setState(() {
                  editWidth = null;
                  editHeight = null;
                  isResizing = false;
                });
              },
              child: Builder(builder: (context) {
                return Opacity(
                  opacity: 0,
                  child: TickerMode(
                    enabled: false,
                    child: _buildHandle(context),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Positioned _wrapResizeHandleWidget(Widget child) {
    return Positioned(
      right: -5,
      bottom: -5,
      child: child,
    );
  }

  Widget _buildHandle(BuildContext context) {
    return Transform.rotate(
      angle: pi * 2 / 360 * 45,
      child: const Icon(
        Icons.chevron_right_rounded,
        color: Colors.grey,
      ),
    );
  }

  @override
  Positioned buildHandle(BuildContext context) {
    return _wrapResizeHandleWidget(
      Transform.rotate(
        angle: pi * 2 / 360 * 45,
        child: const Icon(
          Icons.chevron_right_rounded,
          color: Colors.grey,
        ),
      ),
    );
  }
}
