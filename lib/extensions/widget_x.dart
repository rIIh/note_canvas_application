import 'package:flutter/material.dart';
import 'package:note_canvas_application/extensions/functional_extension.dart';

extension WidgetX on Widget {
  Widget draggable<T extends Object>(T data) => wrap(
        (it) => Draggable<T>(
          data: data,
          feedback: it,
          child: it,
        ),
      );
}
