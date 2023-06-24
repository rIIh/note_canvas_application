import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'note_canvas_bloc.freezed.dart';

typedef _Emitter = Emitter<NoteCanvasState>;

class NoteCanvasBloc extends Bloc<NoteCanvasEvent, NoteCanvasState> {
  final _uuid = const Uuid();

  NoteCanvasBloc() : super(const NoteCanvasState.data({})) {
    on<_Create>(_handleCreate);
    on<_UpdateContent>(_handleUpdateContent);
    on<_UpdatePosition>(_handleUpdatePosition);
    on<_UpdateSize>(_handleUpdateSize);
    on<_ToggleIgnoreHeight>(_handleToggleIgnoreHeight);
  }

  NoteCanvasState _update(
    String id,
    NoteEntity Function(NoteEntity item) builder,
  ) {
    if (!state.notes.containsKey(id)) return state;

    return state.copyWith(
      notes: {
        ...state.notes,
        id: builder(state.notes[id]!).copyWith(updated: DateTime.now()),
      },
    );
  }

  Future<NoteEntity> _handleCreate(_Create event, _Emitter emit) async {
    final note = NoteEntity(
      id: _uuid.v4(),
      content: 'Content',
      position: event.position,
      width: 300,
      updated: DateTime.now(),
    );

    emit(
      NoteCanvasState.data(
        {
          ...state.notes,
          note.id: note,
        },
      ),
    );

    return note;
  }

  FutureOr<void> _handleUpdateContent(_UpdateContent event, _Emitter emit) {
    emit(
      _update(
        event.id,
        (item) => item.copyWith(
          content: event.content,
        ),
      ),
    );
  }

  FutureOr<void> _handleUpdatePosition(_UpdatePosition event, _Emitter emit) {
    emit(
      _update(
        event.id,
        (item) => item.copyWith(
          position: event.position,
        ),
      ),
    );
  }

  FutureOr<void> _handleUpdateSize(_UpdateSize event, _Emitter emit) {
    emit(
      _update(
        event.id,
        (item) => item.copyWith(
          width: event.width,
          height: event.height,
          ignoreHeight: false,
        ),
      ),
    );
  }

  FutureOr<void> _handleToggleIgnoreHeight(
    _ToggleIgnoreHeight event,
    _Emitter emit,
  ) {
    emit(
      _update(
        event.id,
        (item) => item.copyWith(
          ignoreHeight: !item.ignoreHeight,
        ),
      ),
    );
  }
}

@freezed
class NoteCanvasEvent with _$NoteCanvasEvent {
  const factory NoteCanvasEvent.create(Offset position) = _Create;

  const factory NoteCanvasEvent.delete(String id) = _Delete;

  const factory NoteCanvasEvent.updateContent(String id, String content) =
      _UpdateContent;

  const factory NoteCanvasEvent.updatePosition(String id, Offset position) =
      _UpdatePosition;

  const factory NoteCanvasEvent.updateSize(
    String id,
    double width,
    double height,
  ) = _UpdateSize;

  const factory NoteCanvasEvent.toggleIgnoreHeight(String id) =
      _ToggleIgnoreHeight;
}

@freezed
class NoteCanvasState with _$NoteCanvasState {
  const factory NoteCanvasState.data(Map<String, NoteEntity> notes) = _Data;
}

@freezed
class NoteEntity with _$NoteEntity {
  const factory NoteEntity({
    required String id,
    required String content,
    required Offset position,
    required double width,
    required DateTime updated,
    double? height,
    @Default(true) bool ignoreHeight,
  }) = _NoteEntity;
}
