// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lessons_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LessonsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Lesson> lessons) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Lesson> lessons)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Lesson> lessons)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LessonsInitial value) initial,
    required TResult Function(LessonsLoading value) loading,
    required TResult Function(LessonsLoaded value) loaded,
    required TResult Function(LessonsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LessonsInitial value)? initial,
    TResult? Function(LessonsLoading value)? loading,
    TResult? Function(LessonsLoaded value)? loaded,
    TResult? Function(LessonsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LessonsInitial value)? initial,
    TResult Function(LessonsLoading value)? loading,
    TResult Function(LessonsLoaded value)? loaded,
    TResult Function(LessonsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonsStateCopyWith<$Res> {
  factory $LessonsStateCopyWith(
          LessonsState value, $Res Function(LessonsState) then) =
      _$LessonsStateCopyWithImpl<$Res, LessonsState>;
}

/// @nodoc
class _$LessonsStateCopyWithImpl<$Res, $Val extends LessonsState>
    implements $LessonsStateCopyWith<$Res> {
  _$LessonsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LessonsInitialImplCopyWith<$Res> {
  factory _$$LessonsInitialImplCopyWith(_$LessonsInitialImpl value,
          $Res Function(_$LessonsInitialImpl) then) =
      __$$LessonsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LessonsInitialImplCopyWithImpl<$Res>
    extends _$LessonsStateCopyWithImpl<$Res, _$LessonsInitialImpl>
    implements _$$LessonsInitialImplCopyWith<$Res> {
  __$$LessonsInitialImplCopyWithImpl(
      _$LessonsInitialImpl _value, $Res Function(_$LessonsInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LessonsInitialImpl implements LessonsInitial {
  const _$LessonsInitialImpl();

  @override
  String toString() {
    return 'LessonsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LessonsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Lesson> lessons) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Lesson> lessons)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Lesson> lessons)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LessonsInitial value) initial,
    required TResult Function(LessonsLoading value) loading,
    required TResult Function(LessonsLoaded value) loaded,
    required TResult Function(LessonsError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LessonsInitial value)? initial,
    TResult? Function(LessonsLoading value)? loading,
    TResult? Function(LessonsLoaded value)? loaded,
    TResult? Function(LessonsError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LessonsInitial value)? initial,
    TResult Function(LessonsLoading value)? loading,
    TResult Function(LessonsLoaded value)? loaded,
    TResult Function(LessonsError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LessonsInitial implements LessonsState {
  const factory LessonsInitial() = _$LessonsInitialImpl;
}

/// @nodoc
abstract class _$$LessonsLoadingImplCopyWith<$Res> {
  factory _$$LessonsLoadingImplCopyWith(_$LessonsLoadingImpl value,
          $Res Function(_$LessonsLoadingImpl) then) =
      __$$LessonsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LessonsLoadingImplCopyWithImpl<$Res>
    extends _$LessonsStateCopyWithImpl<$Res, _$LessonsLoadingImpl>
    implements _$$LessonsLoadingImplCopyWith<$Res> {
  __$$LessonsLoadingImplCopyWithImpl(
      _$LessonsLoadingImpl _value, $Res Function(_$LessonsLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LessonsLoadingImpl implements LessonsLoading {
  const _$LessonsLoadingImpl();

  @override
  String toString() {
    return 'LessonsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LessonsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Lesson> lessons) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Lesson> lessons)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Lesson> lessons)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LessonsInitial value) initial,
    required TResult Function(LessonsLoading value) loading,
    required TResult Function(LessonsLoaded value) loaded,
    required TResult Function(LessonsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LessonsInitial value)? initial,
    TResult? Function(LessonsLoading value)? loading,
    TResult? Function(LessonsLoaded value)? loaded,
    TResult? Function(LessonsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LessonsInitial value)? initial,
    TResult Function(LessonsLoading value)? loading,
    TResult Function(LessonsLoaded value)? loaded,
    TResult Function(LessonsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LessonsLoading implements LessonsState {
  const factory LessonsLoading() = _$LessonsLoadingImpl;
}

/// @nodoc
abstract class _$$LessonsLoadedImplCopyWith<$Res> {
  factory _$$LessonsLoadedImplCopyWith(
          _$LessonsLoadedImpl value, $Res Function(_$LessonsLoadedImpl) then) =
      __$$LessonsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Lesson> lessons});
}

/// @nodoc
class __$$LessonsLoadedImplCopyWithImpl<$Res>
    extends _$LessonsStateCopyWithImpl<$Res, _$LessonsLoadedImpl>
    implements _$$LessonsLoadedImplCopyWith<$Res> {
  __$$LessonsLoadedImplCopyWithImpl(
      _$LessonsLoadedImpl _value, $Res Function(_$LessonsLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessons = null,
  }) {
    return _then(_$LessonsLoadedImpl(
      null == lessons
          ? _value._lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<Lesson>,
    ));
  }
}

/// @nodoc

class _$LessonsLoadedImpl implements LessonsLoaded {
  const _$LessonsLoadedImpl(final List<Lesson> lessons) : _lessons = lessons;

  final List<Lesson> _lessons;
  @override
  List<Lesson> get lessons {
    if (_lessons is EqualUnmodifiableListView) return _lessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lessons);
  }

  @override
  String toString() {
    return 'LessonsState.loaded(lessons: $lessons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonsLoadedImpl &&
            const DeepCollectionEquality().equals(other._lessons, _lessons));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_lessons));

  /// Create a copy of LessonsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonsLoadedImplCopyWith<_$LessonsLoadedImpl> get copyWith =>
      __$$LessonsLoadedImplCopyWithImpl<_$LessonsLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Lesson> lessons) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(lessons);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Lesson> lessons)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(lessons);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Lesson> lessons)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(lessons);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LessonsInitial value) initial,
    required TResult Function(LessonsLoading value) loading,
    required TResult Function(LessonsLoaded value) loaded,
    required TResult Function(LessonsError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LessonsInitial value)? initial,
    TResult? Function(LessonsLoading value)? loading,
    TResult? Function(LessonsLoaded value)? loaded,
    TResult? Function(LessonsError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LessonsInitial value)? initial,
    TResult Function(LessonsLoading value)? loading,
    TResult Function(LessonsLoaded value)? loaded,
    TResult Function(LessonsError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LessonsLoaded implements LessonsState {
  const factory LessonsLoaded(final List<Lesson> lessons) = _$LessonsLoadedImpl;

  List<Lesson> get lessons;

  /// Create a copy of LessonsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonsLoadedImplCopyWith<_$LessonsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LessonsErrorImplCopyWith<$Res> {
  factory _$$LessonsErrorImplCopyWith(
          _$LessonsErrorImpl value, $Res Function(_$LessonsErrorImpl) then) =
      __$$LessonsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LessonsErrorImplCopyWithImpl<$Res>
    extends _$LessonsStateCopyWithImpl<$Res, _$LessonsErrorImpl>
    implements _$$LessonsErrorImplCopyWith<$Res> {
  __$$LessonsErrorImplCopyWithImpl(
      _$LessonsErrorImpl _value, $Res Function(_$LessonsErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LessonsErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LessonsErrorImpl implements LessonsError {
  const _$LessonsErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LessonsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonsErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of LessonsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonsErrorImplCopyWith<_$LessonsErrorImpl> get copyWith =>
      __$$LessonsErrorImplCopyWithImpl<_$LessonsErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Lesson> lessons) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Lesson> lessons)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Lesson> lessons)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LessonsInitial value) initial,
    required TResult Function(LessonsLoading value) loading,
    required TResult Function(LessonsLoaded value) loaded,
    required TResult Function(LessonsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LessonsInitial value)? initial,
    TResult? Function(LessonsLoading value)? loading,
    TResult? Function(LessonsLoaded value)? loaded,
    TResult? Function(LessonsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LessonsInitial value)? initial,
    TResult Function(LessonsLoading value)? loading,
    TResult Function(LessonsLoaded value)? loaded,
    TResult Function(LessonsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LessonsError implements LessonsState {
  const factory LessonsError(final String message) = _$LessonsErrorImpl;

  String get message;

  /// Create a copy of LessonsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonsErrorImplCopyWith<_$LessonsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
