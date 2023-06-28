import 'package:flutter/material.dart';
import 'package:note_canvas_application/features/core/canvas/presentation/pages/note_canvas_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: Color(
          0xFF232323,
        ),
      ),
      home: NoteCanvasPage(),
    );
  }
}
