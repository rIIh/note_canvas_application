import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:note_canvas_application/features/core/canvas/presentation/views/note_canvas_widget/bloc/note_canvas_bloc.dart';
import 'package:note_canvas_application/features/core/canvas/presentation/widgets/draggable_canvas_item.dart';
import 'package:note_canvas_application/features/core/canvas/presentation/widgets/resizable_canvas_item.dart';
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
    return ResizableCanvasItem(
      onSizeChanged: widget.onSizeChanged,
      child: DraggableCanvasItem(
        data: {'type': 'move', 'id': widget.note.id},
        child: ResizeHandleProvider.tryWrap(
          child: buildDraggableChild(context),
        ),
      ),
    );
  }

  GestureDetector buildDraggableChild(BuildContext context) {
    return GestureDetector(
      onTap: !isEditing ? () => toggle(to: true) : null,
      child: Container(
        width: widget.note.width,
        height: (note.ignoreHeight || isEditing ? null : widget.note.height),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          border: Border.all(
            color: isEditing ? Colors.grey : Color(0xFF1E1E1E),
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
