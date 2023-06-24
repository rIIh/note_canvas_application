import 'dart:math';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:note_canvas_application/features/core/canvas/presentation/widgets/note_canvas_widget/bloc/note_canvas_bloc.dart';
import 'package:note_canvas_application/utility/functional_extension.dart';
import 'package:provider/provider.dart';

const double _kRoundSize = 20;
double clamp(double size) => max(20, size);

Offset roundOffset(Offset position) =>
    Offset(
      (position.dx / _kRoundSize).roundToDouble(),
      (position.dy / _kRoundSize).roundToDouble(),
    ) *
    _kRoundSize;

Size roundSize(Size size) => Size(
      (size.width / _kRoundSize)
          .roundToDouble()
          .let((it) => it * _kRoundSize)
          .let(clamp),
      (size.height / _kRoundSize)
          .roundToDouble()
          .let((it) => it * _kRoundSize)
          .let(clamp),
    );

class NoteCanvasWidget extends StatefulWidget {
  final List<NoteEntity> notes;

  const NoteCanvasWidget({
    super.key,
    this.notes = const [],
  });

  @override
  State<NoteCanvasWidget> createState() => _NoteCanvasWidgetState();
}

class _NoteCanvasWidgetState extends State<NoteCanvasWidget> {
  Offset? tapPosition;
  Offset panOffset = Offset.zero;
  double zoom = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (details) => tapPosition = details.localPosition,
        onTap: () => FocusScope.of(context).unfocus(),
        onDoubleTap: () {
          final tapPosition = this.tapPosition;
          if (tapPosition == null) return;

          final position = roundOffset(tapPosition - panOffset);

          context.read<NoteCanvasBloc>().add(NoteCanvasEvent.create(position));
        },
        onScaleUpdate: (details) {
          setState(() {
            panOffset += details.focalPointDelta;
            zoom = details.scale;
          });
        },
        child: DragTarget<Map<String, dynamic>>(
          onAcceptWithDetails: (details) {
            if (details.data['type'] == 'create') {
              final position = roundOffset(details.offset - panOffset);

              context
                  .read<NoteCanvasBloc>()
                  .add(NoteCanvasEvent.create(position));
            } else if (details.data['type'] == 'move') {
              final String id = details.data['id'];
              final position = roundOffset(details.offset - panOffset);

              context.read<NoteCanvasBloc>().add(
                    NoteCanvasEvent.updatePosition(id, position),
                  );
            }
          },
          builder: (context, candidateData, rejectedData) {
            return Stack(
              children: [
                Positioned.fill(
                  top:
                      (panOffset.dy * MediaQuery.of(context).devicePixelRatio) %
                              80.0 -
                          80,
                  left:
                      (panOffset.dx * MediaQuery.of(context).devicePixelRatio) %
                              80.0 -
                          80,
                  child: Image.asset(
                    'assets/images/dot.png',
                    repeat: ImageRepeat.repeat,
                    filterQuality: FilterQuality.none,
                    scale: zoom,
                    color: Colors.white.withOpacity(.1),
                  ),
                ),
                Positioned.fill(
                  child: Stack(
                    children: [
                      for (final note in widget.notes
                          .sortedBy((element) => element.updated))
                        Positioned(
                          key: ValueKey(note.id),
                          left: note.position.dx + panOffset.dx,
                          top: note.position.dy + panOffset.dy,
                          child: _Note(
                            note: note,
                            onSizeChanged: (value) {
                              value = roundSize(value);
                              context.read<NoteCanvasBloc>().add(
                                    NoteCanvasEvent.updateSize(
                                      note.id,
                                      value.width,
                                      value.height,
                                    ),
                                  );
                            },
                            onToggleHeight: () =>
                                context.read<NoteCanvasBloc>().add(
                                      NoteCanvasEvent.toggleIgnoreHeight(
                                        note.id,
                                      ),
                                    ),
                          ),
                        ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  child: SafeArea(
                    minimum: const EdgeInsets.only(left: 16),
                    child: Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: AnimatedSize(
                        duration: Duration(seconds: 1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Draggable(
                              data: {'type': 'create'},
                              feedback: _Button(),
                              child: _Button(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Note extends StatefulWidget {
  final ValueChanged<Size> onSizeChanged;
  final VoidCallback onToggleHeight;
  final NoteEntity note;
  final bool isFlying;

  const _Note({
    super.key,
    required this.note,
    required this.onSizeChanged,
    required this.onToggleHeight,
    this.isFlying = false,
  });

  _Note flying() => _Note(
        note: note,
        onSizeChanged: onSizeChanged,
        onToggleHeight: onToggleHeight,
        isFlying: true,
      );

  @override
  State<_Note> createState() => _NoteState();
}

class _NoteState extends State<_Note> {
  final FocusNode focusNode = FocusNode();
  late TextEditingController controller =
      TextEditingController(text: widget.note.content);

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
  void didUpdateWidget(covariant _Note oldWidget) {
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
        height: (editHeight.let(clamp) ??
                (note.ignoreHeight || isEditing ? null : widget.note.height))
            .let((it) => it - 2),
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

class _Button extends StatelessWidget {
  const _Button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusDirectional.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.25),
            borderRadius: BorderRadiusDirectional.circular(24),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              CupertinoIcons.doc_richtext,
              size: 32,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
