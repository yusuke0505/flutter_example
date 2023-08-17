// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostItem {
  String get body => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostItemCopyWith<PostItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostItemCopyWith<$Res> {
  factory $PostItemCopyWith(PostItem value, $Res Function(PostItem) then) =
      _$PostItemCopyWithImpl<$Res, PostItem>;
  @useResult
  $Res call({String body, String userId, String id});
}

/// @nodoc
class _$PostItemCopyWithImpl<$Res, $Val extends PostItem>
    implements $PostItemCopyWith<$Res> {
  _$PostItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
    Object? userId = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostItemCopyWith<$Res> implements $PostItemCopyWith<$Res> {
  factory _$$_PostItemCopyWith(
          _$_PostItem value, $Res Function(_$_PostItem) then) =
      __$$_PostItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String body, String userId, String id});
}

/// @nodoc
class __$$_PostItemCopyWithImpl<$Res>
    extends _$PostItemCopyWithImpl<$Res, _$_PostItem>
    implements _$$_PostItemCopyWith<$Res> {
  __$$_PostItemCopyWithImpl(
      _$_PostItem _value, $Res Function(_$_PostItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
    Object? userId = null,
    Object? id = null,
  }) {
    return _then(_$_PostItem(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PostItem extends _PostItem {
  const _$_PostItem(
      {required this.body, required this.userId, required this.id})
      : super._();

  @override
  final String body;
  @override
  final String userId;
  @override
  final String id;

  @override
  String toString() {
    return 'PostItem(body: $body, userId: $userId, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostItem &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body, userId, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostItemCopyWith<_$_PostItem> get copyWith =>
      __$$_PostItemCopyWithImpl<_$_PostItem>(this, _$identity);
}

abstract class _PostItem extends PostItem {
  const factory _PostItem(
      {required final String body,
      required final String userId,
      required final String id}) = _$_PostItem;
  const _PostItem._() : super._();

  @override
  String get body;
  @override
  String get userId;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_PostItemCopyWith<_$_PostItem> get copyWith =>
      throw _privateConstructorUsedError;
}
