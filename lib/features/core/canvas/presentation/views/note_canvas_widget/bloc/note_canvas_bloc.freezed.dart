// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_canvas_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteCanvasEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Offset position) create,
    required TResult Function(String id) delete,
    required TResult Function(String id, String content) updateContent,
    required TResult Function(String id, Offset position) updatePosition,
    required TResult Function(String id, double width, double height)
        updateSize,
    required TResult Function(String id) toggleIgnoreHeight,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Offset position)? create,
    TResult? Function(String id)? delete,
    TResult? Function(String id, String content)? updateContent,
    TResult? Function(String id, Offset position)? updatePosition,
    TResult? Function(String id, double width, double height)? updateSize,
    TResult? Function(String id)? toggleIgnoreHeight,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Offset position)? create,
    TResult Function(String id)? delete,
    TResult Function(String id, String content)? updateContent,
    TResult Function(String id, Offset position)? updatePosition,
    TResult Function(String id, double width, double height)? updateSize,
    TResult Function(String id)? toggleIgnoreHeight,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Delete value) delete,
    required TResult Function(_UpdateContent value) updateContent,
    required TResult Function(_UpdatePosition value) updatePosition,
    required TResult Function(_UpdateSize value) updateSize,
    required TResult Function(_ToggleIgnoreHeight value) toggleIgnoreHeight,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_UpdateContent value)? updateContent,
    TResult? Function(_UpdatePosition value)? updatePosition,
    TResult? Function(_UpdateSize value)? updateSize,
    TResult? Function(_ToggleIgnoreHeight value)? toggleIgnoreHeight,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    TResult Function(_UpdateContent value)? updateContent,
    TResult Function(_UpdatePosition value)? updatePosition,
    TResult Function(_UpdateSize value)? updateSize,
    TResult Function(_ToggleIgnoreHeight value)? toggleIgnoreHeight,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteCanvasEventCopyWith<$Res> {
  factory $NoteCanvasEventCopyWith(
          NoteCanvasEvent value, $Res Function(NoteCanvasEvent) then) =
      _$NoteCanvasEventCopyWithImpl<$Res, NoteCanvasEvent>;
}

/// @nodoc
class _$NoteCanvasEventCopyWithImpl<$Res, $Val extends NoteCanvasEvent>
    implements $NoteCanvasEventCopyWith<$Res> {
  _$NoteCanvasEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_CreateCopyWith<$Res> {
  factory _$$_CreateCopyWith(_$_Create value, $Res Function(_$_Create) then) =
      __$$_CreateCopyWithImpl<$Res>;
  @useResult
  $Res call({Offset position});
}

/// @nodoc
class __$$_CreateCopyWithImpl<$Res>
    extends _$NoteCanvasEventCopyWithImpl<$Res, _$_Create>
    implements _$$_CreateCopyWith<$Res> {
  __$$_CreateCopyWithImpl(_$_Create _value, $Res Function(_$_Create) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
  }) {
    return _then(_$_Create(
      null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$_Create implements _Create {
  const _$_Create(this.position);

  @override
  final Offset position;

  @override
  String toString() {
    return 'NoteCanvasEvent.create(position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Create &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Offset position) create,
    required TResult Function(String id) delete,
    required TResult Function(String id, String content) updateContent,
    required TResult Function(String id, Offset position) updatePosition,
    required TResult Function(String id, double width, double height)
        updateSize,
    required TResult Function(String id) toggleIgnoreHeight,
  }) {
    return create(position);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Offset position)? create,
    TResult? Function(String id)? delete,
    TResult? Function(String id, String content)? updateContent,
    TResult? Function(String id, Offset position)? updatePosition,
    TResult? Function(String id, double width, double height)? updateSize,
    TResult? Function(String id)? toggleIgnoreHeight,
  }) {
    return create?.call(position);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Offset position)? create,
    TResult Function(String id)? delete,
    TResult Function(String id, String content)? updateContent,
    TResult Function(String id, Offset position)? updatePosition,
    TResult Function(String id, double width, double height)? updateSize,
    TResult Function(String id)? toggleIgnoreHeight,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(position);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Delete value) delete,
    required TResult Function(_UpdateContent value) updateContent,
    required TResult Function(_UpdatePosition value) updatePosition,
    required TResult Function(_UpdateSize value) updateSize,
    required TResult Function(_ToggleIgnoreHeight value) toggleIgnoreHeight,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_UpdateContent value)? updateContent,
    TResult? Function(_UpdatePosition value)? updatePosition,
    TResult? Function(_UpdateSize value)? updateSize,
    TResult? Function(_ToggleIgnoreHeight value)? toggleIgnoreHeight,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    TResult Function(_UpdateContent value)? updateContent,
    TResult Function(_UpdatePosition value)? updatePosition,
    TResult Function(_UpdateSize value)? updateSize,
    TResult Function(_ToggleIgnoreHeight value)? toggleIgnoreHeight,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _Create implements NoteCanvasEvent {
  const factory _Create(final Offset position) = _$_Create;

  Offset get position;
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteCopyWith<$Res> {
  factory _$$_DeleteCopyWith(_$_Delete value, $Res Function(_$_Delete) then) =
      __$$_DeleteCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_DeleteCopyWithImpl<$Res>
    extends _$NoteCanvasEventCopyWithImpl<$Res, _$_Delete>
    implements _$$_DeleteCopyWith<$Res> {
  __$$_DeleteCopyWithImpl(_$_Delete _value, $Res Function(_$_Delete) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_Delete(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Delete implements _Delete {
  const _$_Delete(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'NoteCanvasEvent.delete(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Delete &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteCopyWith<_$_Delete> get copyWith =>
      __$$_DeleteCopyWithImpl<_$_Delete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Offset position) create,
    required TResult Function(String id) delete,
    required TResult Function(String id, String content) updateContent,
    required TResult Function(String id, Offset position) updatePosition,
    required TResult Function(String id, double width, double height)
        updateSize,
    required TResult Function(String id) toggleIgnoreHeight,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Offset position)? create,
    TResult? Function(String id)? delete,
    TResult? Function(String id, String content)? updateContent,
    TResult? Function(String id, Offset position)? updatePosition,
    TResult? Function(String id, double width, double height)? updateSize,
    TResult? Function(String id)? toggleIgnoreHeight,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Offset position)? create,
    TResult Function(String id)? delete,
    TResult Function(String id, String content)? updateContent,
    TResult Function(String id, Offset position)? updatePosition,
    TResult Function(String id, double width, double height)? updateSize,
    TResult Function(String id)? toggleIgnoreHeight,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Delete value) delete,
    required TResult Function(_UpdateContent value) updateContent,
    required TResult Function(_UpdatePosition value) updatePosition,
    required TResult Function(_UpdateSize value) updateSize,
    required TResult Function(_ToggleIgnoreHeight value) toggleIgnoreHeight,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_UpdateContent value)? updateContent,
    TResult? Function(_UpdatePosition value)? updatePosition,
    TResult? Function(_UpdateSize value)? updateSize,
    TResult? Function(_ToggleIgnoreHeight value)? toggleIgnoreHeight,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    TResult Function(_UpdateContent value)? updateContent,
    TResult Function(_UpdatePosition value)? updatePosition,
    TResult Function(_UpdateSize value)? updateSize,
    TResult Function(_ToggleIgnoreHeight value)? toggleIgnoreHeight,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements NoteCanvasEvent {
  const factory _Delete(final String id) = _$_Delete;

  String get id;
  @JsonKey(ignore: true)
  _$$_DeleteCopyWith<_$_Delete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateContentCopyWith<$Res> {
  factory _$$_UpdateContentCopyWith(
          _$_UpdateContent value, $Res Function(_$_UpdateContent) then) =
      __$$_UpdateContentCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, String content});
}

/// @nodoc
class __$$_UpdateContentCopyWithImpl<$Res>
    extends _$NoteCanvasEventCopyWithImpl<$Res, _$_UpdateContent>
    implements _$$_UpdateContentCopyWith<$Res> {
  __$$_UpdateContentCopyWithImpl(
      _$_UpdateContent _value, $Res Function(_$_UpdateContent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
  }) {
    return _then(_$_UpdateContent(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateContent implements _UpdateContent {
  const _$_UpdateContent(this.id, this.content);

  @override
  final String id;
  @override
  final String content;

  @override
  String toString() {
    return 'NoteCanvasEvent.updateContent(id: $id, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateContent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateContentCopyWith<_$_UpdateContent> get copyWith =>
      __$$_UpdateContentCopyWithImpl<_$_UpdateContent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Offset position) create,
    required TResult Function(String id) delete,
    required TResult Function(String id, String content) updateContent,
    required TResult Function(String id, Offset position) updatePosition,
    required TResult Function(String id, double width, double height)
        updateSize,
    required TResult Function(String id) toggleIgnoreHeight,
  }) {
    return updateContent(id, content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Offset position)? create,
    TResult? Function(String id)? delete,
    TResult? Function(String id, String content)? updateContent,
    TResult? Function(String id, Offset position)? updatePosition,
    TResult? Function(String id, double width, double height)? updateSize,
    TResult? Function(String id)? toggleIgnoreHeight,
  }) {
    return updateContent?.call(id, content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Offset position)? create,
    TResult Function(String id)? delete,
    TResult Function(String id, String content)? updateContent,
    TResult Function(String id, Offset position)? updatePosition,
    TResult Function(String id, double width, double height)? updateSize,
    TResult Function(String id)? toggleIgnoreHeight,
    required TResult orElse(),
  }) {
    if (updateContent != null) {
      return updateContent(id, content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Delete value) delete,
    required TResult Function(_UpdateContent value) updateContent,
    required TResult Function(_UpdatePosition value) updatePosition,
    required TResult Function(_UpdateSize value) updateSize,
    required TResult Function(_ToggleIgnoreHeight value) toggleIgnoreHeight,
  }) {
    return updateContent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_UpdateContent value)? updateContent,
    TResult? Function(_UpdatePosition value)? updatePosition,
    TResult? Function(_UpdateSize value)? updateSize,
    TResult? Function(_ToggleIgnoreHeight value)? toggleIgnoreHeight,
  }) {
    return updateContent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    TResult Function(_UpdateContent value)? updateContent,
    TResult Function(_UpdatePosition value)? updatePosition,
    TResult Function(_UpdateSize value)? updateSize,
    TResult Function(_ToggleIgnoreHeight value)? toggleIgnoreHeight,
    required TResult orElse(),
  }) {
    if (updateContent != null) {
      return updateContent(this);
    }
    return orElse();
  }
}

abstract class _UpdateContent implements NoteCanvasEvent {
  const factory _UpdateContent(final String id, final String content) =
      _$_UpdateContent;

  String get id;
  String get content;
  @JsonKey(ignore: true)
  _$$_UpdateContentCopyWith<_$_UpdateContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdatePositionCopyWith<$Res> {
  factory _$$_UpdatePositionCopyWith(
          _$_UpdatePosition value, $Res Function(_$_UpdatePosition) then) =
      __$$_UpdatePositionCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, Offset position});
}

/// @nodoc
class __$$_UpdatePositionCopyWithImpl<$Res>
    extends _$NoteCanvasEventCopyWithImpl<$Res, _$_UpdatePosition>
    implements _$$_UpdatePositionCopyWith<$Res> {
  __$$_UpdatePositionCopyWithImpl(
      _$_UpdatePosition _value, $Res Function(_$_UpdatePosition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? position = null,
  }) {
    return _then(_$_UpdatePosition(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$_UpdatePosition implements _UpdatePosition {
  const _$_UpdatePosition(this.id, this.position);

  @override
  final String id;
  @override
  final Offset position;

  @override
  String toString() {
    return 'NoteCanvasEvent.updatePosition(id: $id, position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdatePosition &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdatePositionCopyWith<_$_UpdatePosition> get copyWith =>
      __$$_UpdatePositionCopyWithImpl<_$_UpdatePosition>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Offset position) create,
    required TResult Function(String id) delete,
    required TResult Function(String id, String content) updateContent,
    required TResult Function(String id, Offset position) updatePosition,
    required TResult Function(String id, double width, double height)
        updateSize,
    required TResult Function(String id) toggleIgnoreHeight,
  }) {
    return updatePosition(id, position);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Offset position)? create,
    TResult? Function(String id)? delete,
    TResult? Function(String id, String content)? updateContent,
    TResult? Function(String id, Offset position)? updatePosition,
    TResult? Function(String id, double width, double height)? updateSize,
    TResult? Function(String id)? toggleIgnoreHeight,
  }) {
    return updatePosition?.call(id, position);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Offset position)? create,
    TResult Function(String id)? delete,
    TResult Function(String id, String content)? updateContent,
    TResult Function(String id, Offset position)? updatePosition,
    TResult Function(String id, double width, double height)? updateSize,
    TResult Function(String id)? toggleIgnoreHeight,
    required TResult orElse(),
  }) {
    if (updatePosition != null) {
      return updatePosition(id, position);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Delete value) delete,
    required TResult Function(_UpdateContent value) updateContent,
    required TResult Function(_UpdatePosition value) updatePosition,
    required TResult Function(_UpdateSize value) updateSize,
    required TResult Function(_ToggleIgnoreHeight value) toggleIgnoreHeight,
  }) {
    return updatePosition(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_UpdateContent value)? updateContent,
    TResult? Function(_UpdatePosition value)? updatePosition,
    TResult? Function(_UpdateSize value)? updateSize,
    TResult? Function(_ToggleIgnoreHeight value)? toggleIgnoreHeight,
  }) {
    return updatePosition?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    TResult Function(_UpdateContent value)? updateContent,
    TResult Function(_UpdatePosition value)? updatePosition,
    TResult Function(_UpdateSize value)? updateSize,
    TResult Function(_ToggleIgnoreHeight value)? toggleIgnoreHeight,
    required TResult orElse(),
  }) {
    if (updatePosition != null) {
      return updatePosition(this);
    }
    return orElse();
  }
}

abstract class _UpdatePosition implements NoteCanvasEvent {
  const factory _UpdatePosition(final String id, final Offset position) =
      _$_UpdatePosition;

  String get id;
  Offset get position;
  @JsonKey(ignore: true)
  _$$_UpdatePositionCopyWith<_$_UpdatePosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateSizeCopyWith<$Res> {
  factory _$$_UpdateSizeCopyWith(
          _$_UpdateSize value, $Res Function(_$_UpdateSize) then) =
      __$$_UpdateSizeCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, double width, double height});
}

/// @nodoc
class __$$_UpdateSizeCopyWithImpl<$Res>
    extends _$NoteCanvasEventCopyWithImpl<$Res, _$_UpdateSize>
    implements _$$_UpdateSizeCopyWith<$Res> {
  __$$_UpdateSizeCopyWithImpl(
      _$_UpdateSize _value, $Res Function(_$_UpdateSize) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_$_UpdateSize(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_UpdateSize implements _UpdateSize {
  const _$_UpdateSize(this.id, this.width, this.height);

  @override
  final String id;
  @override
  final double width;
  @override
  final double height;

  @override
  String toString() {
    return 'NoteCanvasEvent.updateSize(id: $id, width: $width, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateSize &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, width, height);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateSizeCopyWith<_$_UpdateSize> get copyWith =>
      __$$_UpdateSizeCopyWithImpl<_$_UpdateSize>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Offset position) create,
    required TResult Function(String id) delete,
    required TResult Function(String id, String content) updateContent,
    required TResult Function(String id, Offset position) updatePosition,
    required TResult Function(String id, double width, double height)
        updateSize,
    required TResult Function(String id) toggleIgnoreHeight,
  }) {
    return updateSize(id, width, height);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Offset position)? create,
    TResult? Function(String id)? delete,
    TResult? Function(String id, String content)? updateContent,
    TResult? Function(String id, Offset position)? updatePosition,
    TResult? Function(String id, double width, double height)? updateSize,
    TResult? Function(String id)? toggleIgnoreHeight,
  }) {
    return updateSize?.call(id, width, height);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Offset position)? create,
    TResult Function(String id)? delete,
    TResult Function(String id, String content)? updateContent,
    TResult Function(String id, Offset position)? updatePosition,
    TResult Function(String id, double width, double height)? updateSize,
    TResult Function(String id)? toggleIgnoreHeight,
    required TResult orElse(),
  }) {
    if (updateSize != null) {
      return updateSize(id, width, height);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Delete value) delete,
    required TResult Function(_UpdateContent value) updateContent,
    required TResult Function(_UpdatePosition value) updatePosition,
    required TResult Function(_UpdateSize value) updateSize,
    required TResult Function(_ToggleIgnoreHeight value) toggleIgnoreHeight,
  }) {
    return updateSize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_UpdateContent value)? updateContent,
    TResult? Function(_UpdatePosition value)? updatePosition,
    TResult? Function(_UpdateSize value)? updateSize,
    TResult? Function(_ToggleIgnoreHeight value)? toggleIgnoreHeight,
  }) {
    return updateSize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    TResult Function(_UpdateContent value)? updateContent,
    TResult Function(_UpdatePosition value)? updatePosition,
    TResult Function(_UpdateSize value)? updateSize,
    TResult Function(_ToggleIgnoreHeight value)? toggleIgnoreHeight,
    required TResult orElse(),
  }) {
    if (updateSize != null) {
      return updateSize(this);
    }
    return orElse();
  }
}

abstract class _UpdateSize implements NoteCanvasEvent {
  const factory _UpdateSize(
      final String id, final double width, final double height) = _$_UpdateSize;

  String get id;
  double get width;
  double get height;
  @JsonKey(ignore: true)
  _$$_UpdateSizeCopyWith<_$_UpdateSize> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ToggleIgnoreHeightCopyWith<$Res> {
  factory _$$_ToggleIgnoreHeightCopyWith(_$_ToggleIgnoreHeight value,
          $Res Function(_$_ToggleIgnoreHeight) then) =
      __$$_ToggleIgnoreHeightCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_ToggleIgnoreHeightCopyWithImpl<$Res>
    extends _$NoteCanvasEventCopyWithImpl<$Res, _$_ToggleIgnoreHeight>
    implements _$$_ToggleIgnoreHeightCopyWith<$Res> {
  __$$_ToggleIgnoreHeightCopyWithImpl(
      _$_ToggleIgnoreHeight _value, $Res Function(_$_ToggleIgnoreHeight) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_ToggleIgnoreHeight(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ToggleIgnoreHeight implements _ToggleIgnoreHeight {
  const _$_ToggleIgnoreHeight(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'NoteCanvasEvent.toggleIgnoreHeight(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToggleIgnoreHeight &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ToggleIgnoreHeightCopyWith<_$_ToggleIgnoreHeight> get copyWith =>
      __$$_ToggleIgnoreHeightCopyWithImpl<_$_ToggleIgnoreHeight>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Offset position) create,
    required TResult Function(String id) delete,
    required TResult Function(String id, String content) updateContent,
    required TResult Function(String id, Offset position) updatePosition,
    required TResult Function(String id, double width, double height)
        updateSize,
    required TResult Function(String id) toggleIgnoreHeight,
  }) {
    return toggleIgnoreHeight(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Offset position)? create,
    TResult? Function(String id)? delete,
    TResult? Function(String id, String content)? updateContent,
    TResult? Function(String id, Offset position)? updatePosition,
    TResult? Function(String id, double width, double height)? updateSize,
    TResult? Function(String id)? toggleIgnoreHeight,
  }) {
    return toggleIgnoreHeight?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Offset position)? create,
    TResult Function(String id)? delete,
    TResult Function(String id, String content)? updateContent,
    TResult Function(String id, Offset position)? updatePosition,
    TResult Function(String id, double width, double height)? updateSize,
    TResult Function(String id)? toggleIgnoreHeight,
    required TResult orElse(),
  }) {
    if (toggleIgnoreHeight != null) {
      return toggleIgnoreHeight(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Delete value) delete,
    required TResult Function(_UpdateContent value) updateContent,
    required TResult Function(_UpdatePosition value) updatePosition,
    required TResult Function(_UpdateSize value) updateSize,
    required TResult Function(_ToggleIgnoreHeight value) toggleIgnoreHeight,
  }) {
    return toggleIgnoreHeight(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_UpdateContent value)? updateContent,
    TResult? Function(_UpdatePosition value)? updatePosition,
    TResult? Function(_UpdateSize value)? updateSize,
    TResult? Function(_ToggleIgnoreHeight value)? toggleIgnoreHeight,
  }) {
    return toggleIgnoreHeight?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    TResult Function(_UpdateContent value)? updateContent,
    TResult Function(_UpdatePosition value)? updatePosition,
    TResult Function(_UpdateSize value)? updateSize,
    TResult Function(_ToggleIgnoreHeight value)? toggleIgnoreHeight,
    required TResult orElse(),
  }) {
    if (toggleIgnoreHeight != null) {
      return toggleIgnoreHeight(this);
    }
    return orElse();
  }
}

abstract class _ToggleIgnoreHeight implements NoteCanvasEvent {
  const factory _ToggleIgnoreHeight(final String id) = _$_ToggleIgnoreHeight;

  String get id;
  @JsonKey(ignore: true)
  _$$_ToggleIgnoreHeightCopyWith<_$_ToggleIgnoreHeight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NoteCanvasState {
  Map<String, NoteEntity> get notes => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, NoteEntity> notes) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, NoteEntity> notes)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, NoteEntity> notes)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Data value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteCanvasStateCopyWith<NoteCanvasState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteCanvasStateCopyWith<$Res> {
  factory $NoteCanvasStateCopyWith(
          NoteCanvasState value, $Res Function(NoteCanvasState) then) =
      _$NoteCanvasStateCopyWithImpl<$Res, NoteCanvasState>;
  @useResult
  $Res call({Map<String, NoteEntity> notes});
}

/// @nodoc
class _$NoteCanvasStateCopyWithImpl<$Res, $Val extends NoteCanvasState>
    implements $NoteCanvasStateCopyWith<$Res> {
  _$NoteCanvasStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as Map<String, NoteEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res>
    implements $NoteCanvasStateCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, NoteEntity> notes});
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res>
    extends _$NoteCanvasStateCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
  }) {
    return _then(_$_Data(
      null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as Map<String, NoteEntity>,
    ));
  }
}

/// @nodoc

class _$_Data implements _Data {
  const _$_Data(final Map<String, NoteEntity> notes) : _notes = notes;

  final Map<String, NoteEntity> _notes;
  @override
  Map<String, NoteEntity> get notes {
    if (_notes is EqualUnmodifiableMapView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_notes);
  }

  @override
  String toString() {
    return 'NoteCanvasState.data(notes: $notes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            const DeepCollectionEquality().equals(other._notes, _notes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_notes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataCopyWith<_$_Data> get copyWith =>
      __$$_DataCopyWithImpl<_$_Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, NoteEntity> notes) data,
  }) {
    return data(notes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, NoteEntity> notes)? data,
  }) {
    return data?.call(notes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, NoteEntity> notes)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(notes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Data value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _Data implements NoteCanvasState {
  const factory _Data(final Map<String, NoteEntity> notes) = _$_Data;

  @override
  Map<String, NoteEntity> get notes;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NoteEntity {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  Offset get position => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;
  DateTime get updated => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  bool get ignoreHeight => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteEntityCopyWith<NoteEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteEntityCopyWith<$Res> {
  factory $NoteEntityCopyWith(
          NoteEntity value, $Res Function(NoteEntity) then) =
      _$NoteEntityCopyWithImpl<$Res, NoteEntity>;
  @useResult
  $Res call(
      {String id,
      String content,
      Offset position,
      double width,
      DateTime updated,
      double? height,
      bool ignoreHeight});
}

/// @nodoc
class _$NoteEntityCopyWithImpl<$Res, $Val extends NoteEntity>
    implements $NoteEntityCopyWith<$Res> {
  _$NoteEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? position = null,
    Object? width = null,
    Object? updated = null,
    Object? height = freezed,
    Object? ignoreHeight = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Offset,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      ignoreHeight: null == ignoreHeight
          ? _value.ignoreHeight
          : ignoreHeight // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NoteEntityCopyWith<$Res>
    implements $NoteEntityCopyWith<$Res> {
  factory _$$_NoteEntityCopyWith(
          _$_NoteEntity value, $Res Function(_$_NoteEntity) then) =
      __$$_NoteEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      Offset position,
      double width,
      DateTime updated,
      double? height,
      bool ignoreHeight});
}

/// @nodoc
class __$$_NoteEntityCopyWithImpl<$Res>
    extends _$NoteEntityCopyWithImpl<$Res, _$_NoteEntity>
    implements _$$_NoteEntityCopyWith<$Res> {
  __$$_NoteEntityCopyWithImpl(
      _$_NoteEntity _value, $Res Function(_$_NoteEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? position = null,
    Object? width = null,
    Object? updated = null,
    Object? height = freezed,
    Object? ignoreHeight = null,
  }) {
    return _then(_$_NoteEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Offset,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      ignoreHeight: null == ignoreHeight
          ? _value.ignoreHeight
          : ignoreHeight // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_NoteEntity implements _NoteEntity {
  const _$_NoteEntity(
      {required this.id,
      required this.content,
      required this.position,
      required this.width,
      required this.updated,
      this.height,
      this.ignoreHeight = true});

  @override
  final String id;
  @override
  final String content;
  @override
  final Offset position;
  @override
  final double width;
  @override
  final DateTime updated;
  @override
  final double? height;
  @override
  @JsonKey()
  final bool ignoreHeight;

  @override
  String toString() {
    return 'NoteEntity(id: $id, content: $content, position: $position, width: $width, updated: $updated, height: $height, ignoreHeight: $ignoreHeight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoteEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.ignoreHeight, ignoreHeight) ||
                other.ignoreHeight == ignoreHeight));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, content, position, width, updated, height, ignoreHeight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NoteEntityCopyWith<_$_NoteEntity> get copyWith =>
      __$$_NoteEntityCopyWithImpl<_$_NoteEntity>(this, _$identity);
}

abstract class _NoteEntity implements NoteEntity {
  const factory _NoteEntity(
      {required final String id,
      required final String content,
      required final Offset position,
      required final double width,
      required final DateTime updated,
      final double? height,
      final bool ignoreHeight}) = _$_NoteEntity;

  @override
  String get id;
  @override
  String get content;
  @override
  Offset get position;
  @override
  double get width;
  @override
  DateTime get updated;
  @override
  double? get height;
  @override
  bool get ignoreHeight;
  @override
  @JsonKey(ignore: true)
  _$$_NoteEntityCopyWith<_$_NoteEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
