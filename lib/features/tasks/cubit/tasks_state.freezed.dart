// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TasksState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Task> tasks) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Task> tasks)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Task> tasks)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TasksInitial value) initial,
    required TResult Function(TasksLoading value) loading,
    required TResult Function(TasksLoaded value) loaded,
    required TResult Function(TasksError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TasksInitial value)? initial,
    TResult? Function(TasksLoading value)? loading,
    TResult? Function(TasksLoaded value)? loaded,
    TResult? Function(TasksError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksInitial value)? initial,
    TResult Function(TasksLoading value)? loading,
    TResult Function(TasksLoaded value)? loaded,
    TResult Function(TasksError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksStateCopyWith<$Res> {
  factory $TasksStateCopyWith(
          TasksState value, $Res Function(TasksState) then) =
      _$TasksStateCopyWithImpl<$Res, TasksState>;
}

/// @nodoc
class _$TasksStateCopyWithImpl<$Res, $Val extends TasksState>
    implements $TasksStateCopyWith<$Res> {
  _$TasksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TasksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TasksInitialImplCopyWith<$Res> {
  factory _$$TasksInitialImplCopyWith(
          _$TasksInitialImpl value, $Res Function(_$TasksInitialImpl) then) =
      __$$TasksInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TasksInitialImplCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$TasksInitialImpl>
    implements _$$TasksInitialImplCopyWith<$Res> {
  __$$TasksInitialImplCopyWithImpl(
      _$TasksInitialImpl _value, $Res Function(_$TasksInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TasksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TasksInitialImpl implements TasksInitial {
  const _$TasksInitialImpl();

  @override
  String toString() {
    return 'TasksState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TasksInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Task> tasks) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Task> tasks)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Task> tasks)? loaded,
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
    required TResult Function(TasksInitial value) initial,
    required TResult Function(TasksLoading value) loading,
    required TResult Function(TasksLoaded value) loaded,
    required TResult Function(TasksError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TasksInitial value)? initial,
    TResult? Function(TasksLoading value)? loading,
    TResult? Function(TasksLoaded value)? loaded,
    TResult? Function(TasksError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksInitial value)? initial,
    TResult Function(TasksLoading value)? loading,
    TResult Function(TasksLoaded value)? loaded,
    TResult Function(TasksError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TasksInitial implements TasksState {
  const factory TasksInitial() = _$TasksInitialImpl;
}

/// @nodoc
abstract class _$$TasksLoadingImplCopyWith<$Res> {
  factory _$$TasksLoadingImplCopyWith(
          _$TasksLoadingImpl value, $Res Function(_$TasksLoadingImpl) then) =
      __$$TasksLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TasksLoadingImplCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$TasksLoadingImpl>
    implements _$$TasksLoadingImplCopyWith<$Res> {
  __$$TasksLoadingImplCopyWithImpl(
      _$TasksLoadingImpl _value, $Res Function(_$TasksLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TasksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TasksLoadingImpl implements TasksLoading {
  const _$TasksLoadingImpl();

  @override
  String toString() {
    return 'TasksState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TasksLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Task> tasks) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Task> tasks)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Task> tasks)? loaded,
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
    required TResult Function(TasksInitial value) initial,
    required TResult Function(TasksLoading value) loading,
    required TResult Function(TasksLoaded value) loaded,
    required TResult Function(TasksError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TasksInitial value)? initial,
    TResult? Function(TasksLoading value)? loading,
    TResult? Function(TasksLoaded value)? loaded,
    TResult? Function(TasksError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksInitial value)? initial,
    TResult Function(TasksLoading value)? loading,
    TResult Function(TasksLoaded value)? loaded,
    TResult Function(TasksError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TasksLoading implements TasksState {
  const factory TasksLoading() = _$TasksLoadingImpl;
}

/// @nodoc
abstract class _$$TasksLoadedImplCopyWith<$Res> {
  factory _$$TasksLoadedImplCopyWith(
          _$TasksLoadedImpl value, $Res Function(_$TasksLoadedImpl) then) =
      __$$TasksLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Task> tasks});
}

/// @nodoc
class __$$TasksLoadedImplCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$TasksLoadedImpl>
    implements _$$TasksLoadedImplCopyWith<$Res> {
  __$$TasksLoadedImplCopyWithImpl(
      _$TasksLoadedImpl _value, $Res Function(_$TasksLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TasksState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_$TasksLoadedImpl(
      null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc

class _$TasksLoadedImpl implements TasksLoaded {
  const _$TasksLoadedImpl(final List<Task> tasks) : _tasks = tasks;

  final List<Task> _tasks;
  @override
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'TasksState.loaded(tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksLoadedImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  /// Create a copy of TasksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksLoadedImplCopyWith<_$TasksLoadedImpl> get copyWith =>
      __$$TasksLoadedImplCopyWithImpl<_$TasksLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Task> tasks) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(tasks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Task> tasks)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(tasks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Task> tasks)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(tasks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TasksInitial value) initial,
    required TResult Function(TasksLoading value) loading,
    required TResult Function(TasksLoaded value) loaded,
    required TResult Function(TasksError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TasksInitial value)? initial,
    TResult? Function(TasksLoading value)? loading,
    TResult? Function(TasksLoaded value)? loaded,
    TResult? Function(TasksError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksInitial value)? initial,
    TResult Function(TasksLoading value)? loading,
    TResult Function(TasksLoaded value)? loaded,
    TResult Function(TasksError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TasksLoaded implements TasksState {
  const factory TasksLoaded(final List<Task> tasks) = _$TasksLoadedImpl;

  List<Task> get tasks;

  /// Create a copy of TasksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TasksLoadedImplCopyWith<_$TasksLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TasksErrorImplCopyWith<$Res> {
  factory _$$TasksErrorImplCopyWith(
          _$TasksErrorImpl value, $Res Function(_$TasksErrorImpl) then) =
      __$$TasksErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TasksErrorImplCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$TasksErrorImpl>
    implements _$$TasksErrorImplCopyWith<$Res> {
  __$$TasksErrorImplCopyWithImpl(
      _$TasksErrorImpl _value, $Res Function(_$TasksErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of TasksState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TasksErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TasksErrorImpl implements TasksError {
  const _$TasksErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TasksState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TasksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksErrorImplCopyWith<_$TasksErrorImpl> get copyWith =>
      __$$TasksErrorImplCopyWithImpl<_$TasksErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Task> tasks) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Task> tasks)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Task> tasks)? loaded,
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
    required TResult Function(TasksInitial value) initial,
    required TResult Function(TasksLoading value) loading,
    required TResult Function(TasksLoaded value) loaded,
    required TResult Function(TasksError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TasksInitial value)? initial,
    TResult? Function(TasksLoading value)? loading,
    TResult? Function(TasksLoaded value)? loaded,
    TResult? Function(TasksError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksInitial value)? initial,
    TResult Function(TasksLoading value)? loading,
    TResult Function(TasksLoaded value)? loaded,
    TResult Function(TasksError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TasksError implements TasksState {
  const factory TasksError(final String message) = _$TasksErrorImpl;

  String get message;

  /// Create a copy of TasksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TasksErrorImplCopyWith<_$TasksErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
