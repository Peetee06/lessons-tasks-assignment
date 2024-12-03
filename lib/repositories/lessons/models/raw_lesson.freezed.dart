// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'raw_lesson.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RawLesson _$RawLessonFromJson(Map<String, dynamic> json) {
  return _RawLesson.fromJson(json);
}

/// @nodoc
mixin _$RawLesson {
  String get id => throw _privateConstructorUsedError;
  Map<String, String> get title => throw _privateConstructorUsedError;
  List<Page> get pages => throw _privateConstructorUsedError;
  List<String> get taskIds => throw _privateConstructorUsedError;

  /// Serializes this RawLesson to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RawLesson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RawLessonCopyWith<RawLesson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RawLessonCopyWith<$Res> {
  factory $RawLessonCopyWith(RawLesson value, $Res Function(RawLesson) then) =
      _$RawLessonCopyWithImpl<$Res, RawLesson>;
  @useResult
  $Res call(
      {String id,
      Map<String, String> title,
      List<Page> pages,
      List<String> taskIds});
}

/// @nodoc
class _$RawLessonCopyWithImpl<$Res, $Val extends RawLesson>
    implements $RawLessonCopyWith<$Res> {
  _$RawLessonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RawLesson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? pages = null,
    Object? taskIds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<Page>,
      taskIds: null == taskIds
          ? _value.taskIds
          : taskIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RawLessonImplCopyWith<$Res>
    implements $RawLessonCopyWith<$Res> {
  factory _$$RawLessonImplCopyWith(
          _$RawLessonImpl value, $Res Function(_$RawLessonImpl) then) =
      __$$RawLessonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Map<String, String> title,
      List<Page> pages,
      List<String> taskIds});
}

/// @nodoc
class __$$RawLessonImplCopyWithImpl<$Res>
    extends _$RawLessonCopyWithImpl<$Res, _$RawLessonImpl>
    implements _$$RawLessonImplCopyWith<$Res> {
  __$$RawLessonImplCopyWithImpl(
      _$RawLessonImpl _value, $Res Function(_$RawLessonImpl) _then)
      : super(_value, _then);

  /// Create a copy of RawLesson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? pages = null,
    Object? taskIds = null,
  }) {
    return _then(_$RawLessonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value._title
          : title // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      pages: null == pages
          ? _value._pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<Page>,
      taskIds: null == taskIds
          ? _value._taskIds
          : taskIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RawLessonImpl implements _RawLesson {
  const _$RawLessonImpl(
      {required this.id,
      required final Map<String, String> title,
      required final List<Page> pages,
      required final List<String> taskIds})
      : _title = title,
        _pages = pages,
        _taskIds = taskIds;

  factory _$RawLessonImpl.fromJson(Map<String, dynamic> json) =>
      _$$RawLessonImplFromJson(json);

  @override
  final String id;
  final Map<String, String> _title;
  @override
  Map<String, String> get title {
    if (_title is EqualUnmodifiableMapView) return _title;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_title);
  }

  final List<Page> _pages;
  @override
  List<Page> get pages {
    if (_pages is EqualUnmodifiableListView) return _pages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pages);
  }

  final List<String> _taskIds;
  @override
  List<String> get taskIds {
    if (_taskIds is EqualUnmodifiableListView) return _taskIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taskIds);
  }

  @override
  String toString() {
    return 'RawLesson(id: $id, title: $title, pages: $pages, taskIds: $taskIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RawLessonImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._title, _title) &&
            const DeepCollectionEquality().equals(other._pages, _pages) &&
            const DeepCollectionEquality().equals(other._taskIds, _taskIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_title),
      const DeepCollectionEquality().hash(_pages),
      const DeepCollectionEquality().hash(_taskIds));

  /// Create a copy of RawLesson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RawLessonImplCopyWith<_$RawLessonImpl> get copyWith =>
      __$$RawLessonImplCopyWithImpl<_$RawLessonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RawLessonImplToJson(
      this,
    );
  }
}

abstract class _RawLesson implements RawLesson {
  const factory _RawLesson(
      {required final String id,
      required final Map<String, String> title,
      required final List<Page> pages,
      required final List<String> taskIds}) = _$RawLessonImpl;

  factory _RawLesson.fromJson(Map<String, dynamic> json) =
      _$RawLessonImpl.fromJson;

  @override
  String get id;
  @override
  Map<String, String> get title;
  @override
  List<Page> get pages;
  @override
  List<String> get taskIds;

  /// Create a copy of RawLesson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RawLessonImplCopyWith<_$RawLessonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
