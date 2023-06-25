import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:note_canvas_application/features/core/canvas/presentation/views/note_canvas_widget/bloc/note_canvas_bloc.dart';
import 'package:note_canvas_application/features/core/canvas/presentation/views/note_canvas_widget/note_canvas_widget.dart';
import 'package:note_canvas_application/utility/functional_extension.dart';
import 'package:provider/provider.dart';

class NoteWidget extends StatefulWidget {
  final ValueChanged<Size> onSizeChanged;
  final VoidCallback onToggleHeight;
  final NoteEntity note;
  final bool isFlying;

  const NoteWidget({
    super.key,
    required this.note,
    required this.onSizeChanged,
    required this.onToggleHeight,
    this.isFlying = false,
  });

  NoteWidget flying() => NoteWidget(
        note: note,
        onSizeChanged: onSizeChanged,
        onToggleHeight: onToggleHeight,
        isFlying: true,
      );

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  final FocusNode focusNode = FocusNode();
  late TextEditingController controller = TextEditingController(text: widget.note.content);

  NoteEntity get note => widget.note;

  bool isEditing = false;
  bool isDragging = false;

  double? editHeight;
  double? editWidth;

  @override
  void initState() {
    focusNode.addListener(() {
      if (!focusNode.hasPrimaryFocus && isEditing) {
        toggle(to: false);
      }
    });

    super.initState();
  }

  @override
  void didUpdateWidget(covariant NoteWidget oldWidget) {
    if (controller.text != widget.note.content) {
      controller.text = widget.note.content;
    }

    super.didUpdateWidget(oldWidget);
  }

  void toggle({required bool to}) {
    setState(() {
      isEditing = to;
    });

    if (isEditing) {
      Future.microtask(() => focusNode.requestFocus());
    }
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDragging ? .0 : 1.0,
      child: IgnorePointer(
        ignoring: isDragging,
        child: TickerMode(
          enabled: !isDragging,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Draggable(
                  data: {'type': 'move', 'id': widget.note.id},
                  onDragStarted: () => setState(() => isDragging = true),
                  onDragEnd: (_) => setState(() => isDragging = false),
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
                    child: widget.flying(),
                  ),
                  child: buildDraggableChild(context),
                ),
                Positioned(
                  bottom: -5,
                  right: -5,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onDoubleTap: widget.onToggleHeight,
                    onPanStart: (details) {
                      editWidth = widget.note.width;
                      editHeight = context.size?.height ?? 500;
                    },
                    onPanUpdate: (details) {
                      setState(() {
                        final width = editWidth;
                        final height = editHeight;
                        if (width == null || height == null) return;

                        editWidth = width + details.delta.dx;
                        editHeight = height + details.delta.dy;
                      });
                    },
                    onPanEnd: (details) {
                      final width = editWidth;
                      final height = editHeight;
                      if (width == null || height == null) return;

                      widget.onSizeChanged(Size(width, height));

                      setState(() {
                        editWidth = null;
                        editHeight = null;
                      });
                    },
                    child: Transform.rotate(
                      angle: pi * 2 / 360 * 45,
                      child: const Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector buildDraggableChild(BuildContext context) {
    return GestureDetector(
      onTap: !isEditing ? () => toggle(to: true) : null,
      child: Container(
        width: (editWidth.let(clamp) ?? widget.note.width) - 2,
        height:
            (editHeight.let(clamp) ?? (note.ignoreHeight || isEditing ? null : widget.note.height)).let((it) => it - 2),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          border: Border.all(
            color: isEditing ? Colors.white : Colors.black.withOpacity(.1),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.black.withOpacity(.1),
            ),
          ],
        ),
        child: UnconstrainedBox(
          alignment: AlignmentDirectional.topStart,
          constrainedAxis: Axis.horizontal,
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: isEditing || widget.note.content.isEmpty
                ? IgnorePointer(
                    ignoring: !isEditing,
                    child: TextField(
                      focusNode: focusNode,
                      decoration: const InputDecoration.collapsed(
                        hintText: 'note content',
                      ),
                      maxLines: null,
                      controller: controller,
                      onChanged: (value) => context.read<NoteCanvasBloc>().add(
                            NoteCanvasEvent.updateContent(
                              widget.note.id,
                              value,
                            ),
                          ),
                    ),
                  )
                : MarkdownBody(data: widget.note.content),
          ),
        ),
      ),
    );
  }
}
