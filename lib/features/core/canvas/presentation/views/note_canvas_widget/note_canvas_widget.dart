import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_canvas_application/features/core/canvas/presentation/views/note_canvas_widget/bloc/note_canvas_bloc.dart';
import 'package:note_canvas_application/features/core/canvas/presentation/widgets/note_widget.dart';
import 'package:note_canvas_application/features/core/canvas/presentation/widgets/pattern_painter.dart';
import 'package:note_canvas_application/features/core/canvas/presentation/widgets/toolbar_button.dart';
import 'package:note_canvas_application/extensions/functional_extension.dart';
import 'package:note_canvas_application/extensions/widget_x.dart';
import 'package:note_canvas_application/widgets/debug_border.dart';
import 'package:provider/provider.dart';
import 'package:tabler_icons/tabler_icons.dart';

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
  TransformationController controller = TransformationController();
  Offset? tapPosition;
  Offset panOffset = Offset.zero;
  double get zoom => controller.value.getMaxScaleOnAxis();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: InteractiveViewer(
            transformationController: controller,
            onInteractionUpdate: (details) => setState(() {
              panOffset += details.focalPointDelta / zoom; // todo fix zoom scale drag
            }),
            child: SizedBox.expand(
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
                          child: PatternPainter(
                            offset: panOffset,
                            size: _kRoundSize,
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
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF232323),
              border: const Border(top: BorderSide(width: 2, color: Color(0xFF303030))),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(.25), blurRadius: 8)],
            ),
            child: AnimatedSize(
              duration: const Duration(seconds: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ToolbarButton(
                    child: Icon(TablerIcons.pencil),
                  ),
                  const SizedBox(width: 8),
                  const ToolbarButton(
                    child: Icon(TablerIcons.note),
                  ).draggable({'type': 'create'}),
                  const SizedBox(width: 8),
                  const ToolbarButton(
                    child: Icon(TablerIcons.layout_navbar_expand),
                  ),
                ],
              ),
            ),
          ).debugDimensions(),
        ),
      ],
    );
  }
}
