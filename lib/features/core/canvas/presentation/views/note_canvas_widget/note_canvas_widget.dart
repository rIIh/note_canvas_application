import 'dart:math';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_canvas_application/features/core/canvas/presentation/views/note_canvas_widget/bloc/note_canvas_bloc.dart';
import 'package:note_canvas_application/features/core/canvas/presentation/widgets/note_widget.dart';
import 'package:note_canvas_application/features/core/canvas/presentation/widgets/toolbar_button.dart';
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
      (size.width / _kRoundSize).roundToDouble().let((it) => it * _kRoundSize).let(clamp),
      (size.height / _kRoundSize).roundToDouble().let((it) => it * _kRoundSize).let(clamp),
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

              context.read<NoteCanvasBloc>().add(NoteCanvasEvent.create(position));
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
                  top: (panOffset.dy * MediaQuery.of(context).devicePixelRatio) % 80.0 - 80,
                  left: (panOffset.dx * MediaQuery.of(context).devicePixelRatio) % 80.0 - 80,
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
                      for (final note in widget.notes.sortedBy((element) => element.updated))
                        Positioned(
                          key: ValueKey(note.id),
                          left: note.position.dx + panOffset.dx,
                          top: note.position.dy + panOffset.dy,
                          child: NoteWidget(
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
                            onToggleHeight: () => context.read<NoteCanvasBloc>().add(
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
                          children: [
                            const ToolbarButton(
                              child: Icon(
                                CupertinoIcons.doc_richtext,
                                size: 24,
                              ),
                            ).wrap(
                              (it) => Draggable(
                                data: {'type': 'create'},
                                child: it,
                                feedback: it,
                              ),
                            ),
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
