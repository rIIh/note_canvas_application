import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_canvas_application/features/core/canvas/presentation/views/note_canvas_widget/bloc/note_canvas_bloc.dart';
import 'package:note_canvas_application/features/core/canvas/presentation/views/note_canvas_widget/note_canvas_widget.dart';

class NoteCanvasPage extends StatelessWidget {
  const NoteCanvasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCanvasBloc(),
      child: BlocBuilder<NoteCanvasBloc, NoteCanvasState>(
        builder: (context, state) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: NoteCanvasWidget(
            notes: state.notes.values.toList(),
          ),
        ),
      ),
    );
  }
}
