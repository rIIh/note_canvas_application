import 'package:flutter/material.dart';

class DraggableCanvasItem<T extends Object> extends StatefulWidget {
  final T data;
  final Widget child;

  const DraggableCanvasItem({
    super.key,
    required this.data,
    required this.child,
  });

  @override
  State<DraggableCanvasItem<T>> createState() => _DraggableCanvasItemState<T>();
}

class _DraggableCanvasItemState<T extends Object> extends State<DraggableCanvasItem<T>> {
  bool isDragging = false;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDragging ? .0 : 1.0,
      child: Draggable(
        data: widget.data,
        onDragStarted: () => setState(() => isDragging = true),
        onDragEnd: (_) => setState(() => isDragging = false),
        hitTestBehavior: HitTestBehavior.translucent,
        feedback: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 6),
                blurRadius: 8,
                color: Colors.black.withOpacity(.2),
              )
            ],
          ),
          child: widget.child,
        ),
        child: widget.child,
      ),
    );
  }
}
