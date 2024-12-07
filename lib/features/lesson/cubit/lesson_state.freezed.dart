// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LessonState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Lesson lesson) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Lesson lesson)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Lesson lesson)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LessonInitial value) initial,
    required TResult Function(LessonLoading value) loading,
    required TResult Function(LessonLoaded value) loaded,
    required TResult Function(LessonError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LessonInitial value)? initial,
    TResult? Function(LessonLoading value)? loading,
    TResult? Function(LessonLoaded value)? loaded,
    TResult? Function(LessonError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LessonInitial value)? initial,
    TResult Function(LessonLoading value)? loading,
    TResult Function(LessonLoaded value)? loaded,
    TResult Function(LessonError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonStateCopyWith<$Res> {
  factory $LessonStateCopyWith(
          LessonState value, $Res Function(LessonState) then) =
      _$LessonStateCopyWithImpl<$Res, LessonState>;
}

/// @nodoc
class _$LessonStateCopyWithImpl<$Res, $Val extends LessonState>
    implements $LessonStateCopyWith<$Res> {
  _$LessonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LessonInitialImplCopyWith<$Res> {
  factory _$$LessonInitialImplCopyWith(
          _$LessonInitialImpl value, $Res Function(_$LessonInitialImpl) then) =
      __$$LessonInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LessonInitialImplCopyWithImpl<$Res>
    extends _$LessonStateCopyWithImpl<$Res, _$LessonInitialImpl>
    implements _$$LessonInitialImplCopyWith<$Res> {
  __$$LessonInitialImplCopyWithImpl(
      _$LessonInitialImpl _value, $Res Function(_$LessonInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LessonInitialImpl implements LessonInitial {
  const _$LessonInitialImpl();

  @override
  String toString() {
    return 'LessonState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LessonInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Lesson lesson) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Lesson lesson)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Lesson lesson)? loaded,
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
    required TResult Function(LessonInitial value) initial,
    required TResult Function(LessonLoading value) loading,
    required TResult Function(LessonLoaded value) loaded,
    required TResult Function(LessonError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LessonInitial value)? initial,
    TResult? Function(LessonLoading value)? loading,
    TResult? Function(LessonLoaded value)? loaded,
    TResult? Function(LessonError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LessonInitial value)? initial,
    TResult Function(LessonLoading value)? loading,
    TResult Function(LessonLoaded value)? loaded,
    TResult Function(LessonError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LessonInitial implements LessonState {
  const factory LessonInitial() = _$LessonInitialImpl;
}

/// @nodoc
abstract class _$$LessonLoadingImplCopyWith<$Res> {
  factory _$$LessonLoadingImplCopyWith(
          _$LessonLoadingImpl value, $Res Function(_$LessonLoadingImpl) then) =
      __$$LessonLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LessonLoadingImplCopyWithImpl<$Res>
    extends _$LessonStateCopyWithImpl<$Res, _$LessonLoadingImpl>
    implements _$$LessonLoadingImplCopyWith<$Res> {
  __$$LessonLoadingImplCopyWithImpl(
      _$LessonLoadingImpl _value, $Res Function(_$LessonLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LessonLoadingImpl implements LessonLoading {
  const _$LessonLoadingImpl();

  @override
  String toString() {
    return 'LessonState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LessonLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Lesson lesson) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Lesson lesson)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Lesson lesson)? loaded,
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
    required TResult Function(LessonInitial value) initial,
    required TResult Function(LessonLoading value) loading,
    required TResult Function(LessonLoaded value) loaded,
    required TResult Function(LessonError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LessonInitial value)? initial,
    TResult? Function(LessonLoading value)? loading,
    TResult? Function(LessonLoaded value)? loaded,
    TResult? Function(LessonError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LessonInitial value)? initial,
    TResult Function(LessonLoading value)? loading,
    TResult Function(LessonLoaded value)? loaded,
    TResult Function(LessonError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LessonLoading implements LessonState {
  const factory LessonLoading() = _$LessonLoadingImpl;
}

/// @nodoc
abstract class _$$LessonLoadedImplCopyWith<$Res> {
  factory _$$LessonLoadedImplCopyWith(
          _$LessonLoadedImpl value, $Res Function(_$LessonLoadedImpl) then) =
      __$$LessonLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Lesson lesson});

  $LessonCopyWith<$Res> get lesson;
}

/// @nodoc
class __$$LessonLoadedImplCopyWithImpl<$Res>
    extends _$LessonStateCopyWithImpl<$Res, _$LessonLoadedImpl>
    implements _$$LessonLoadedImplCopyWith<$Res> {
  __$$LessonLoadedImplCopyWithImpl(
      _$LessonLoadedImpl _value, $Res Function(_$LessonLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lesson = null,
  }) {
    return _then(_$LessonLoadedImpl(
      null == lesson
          ? _value.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as Lesson,
    ));
  }

  /// Create a copy of LessonState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LessonCopyWith<$Res> get lesson {
    return $LessonCopyWith<$Res>(_value.lesson, (value) {
      return _then(_value.copyWith(lesson: value));
    });
  }
}

/// @nodoc

class _$LessonLoadedImpl implements LessonLoaded {
  const _$LessonLoadedImpl(this.lesson);

  @override
  final Lesson lesson;

  @override
  String toString() {
    return 'LessonState.loaded(lesson: $lesson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonLoadedImpl &&
            (identical(other.lesson, lesson) || other.lesson == lesson));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lesson);

  /// Create a copy of LessonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonLoadedImplCopyWith<_$LessonLoadedImpl> get copyWith =>
      __$$LessonLoadedImplCopyWithImpl<_$LessonLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Lesson lesson) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(lesson);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Lesson lesson)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(lesson);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Lesson lesson)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(lesson);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LessonInitial value) initial,
    required TResult Function(LessonLoading value) loading,
    required TResult Function(LessonLoaded value) loaded,
    required TResult Function(LessonError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LessonInitial value)? initial,
    TResult? Function(LessonLoading value)? loading,
    TResult? Function(LessonLoaded value)? loaded,
    TResult? Function(LessonError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LessonInitial value)? initial,
    TResult Function(LessonLoading value)? loading,
    TResult Function(LessonLoaded value)? loaded,
    TResult Function(LessonError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LessonLoaded implements LessonState {
  const factory LessonLoaded(final Lesson lesson) = _$LessonLoadedImpl;

  Lesson get lesson;

  /// Create a copy of LessonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonLoadedImplCopyWith<_$LessonLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LessonErrorImplCopyWith<$Res> {
  factory _$$LessonErrorImplCopyWith(
          _$LessonErrorImpl value, $Res Function(_$LessonErrorImpl) then) =
      __$$LessonErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LessonErrorImplCopyWithImpl<$Res>
    extends _$LessonStateCopyWithImpl<$Res, _$LessonErrorImpl>
    implements _$$LessonErrorImplCopyWith<$Res> {
  __$$LessonErrorImplCopyWithImpl(
      _$LessonErrorImpl _value, $Res Function(_$LessonErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LessonErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LessonErrorImpl implements LessonError {
  const _$LessonErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LessonState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of LessonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonErrorImplCopyWith<_$LessonErrorImpl> get copyWith =>
      __$$LessonErrorImplCopyWithImpl<_$LessonErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Lesson lesson) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Lesson lesson)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Lesson lesson)? loaded,
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
    required TResult Function(LessonInitial value) initial,
    required TResult Function(LessonLoading value) loading,
    required TResult Function(LessonLoaded value) loaded,
    required TResult Function(LessonError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LessonInitial value)? initial,
    TResult? Function(LessonLoading value)? loading,
    TResult? Function(LessonLoaded value)? loaded,
    TResult? Function(LessonError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LessonInitial value)? initial,
    TResult Function(LessonLoading value)? loading,
    TResult Function(LessonLoaded value)? loaded,
    TResult Function(LessonError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LessonError implements LessonState {
  const factory LessonError(final String message) = _$LessonErrorImpl;

  String get message;

  /// Create a copy of LessonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonErrorImplCopyWith<_$LessonErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
