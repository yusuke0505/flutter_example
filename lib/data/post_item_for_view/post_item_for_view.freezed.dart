// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_item_for_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostItemForView {
  String get postItemId => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  User get userItem => throw _privateConstructorUsedError;
  bool get isFavorited => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostItemForViewCopyWith<PostItemForView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostItemForViewCopyWith<$Res> {
  factory $PostItemForViewCopyWith(
          PostItemForView value, $Res Function(PostItemForView) then) =
      _$PostItemForViewCopyWithImpl<$Res, PostItemForView>;
  @useResult
  $Res call({String postItemId, String body, User userItem, bool isFavorited});

  $UserCopyWith<$Res> get userItem;
}

/// @nodoc
class _$PostItemForViewCopyWithImpl<$Res, $Val extends PostItemForView>
    implements $PostItemForViewCopyWith<$Res> {
  _$PostItemForViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postItemId = null,
    Object? body = null,
    Object? userItem = null,
    Object? isFavorited = null,
  }) {
    return _then(_value.copyWith(
      postItemId: null == postItemId
          ? _value.postItemId
          : postItemId // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      userItem: null == userItem
          ? _value.userItem
          : userItem // ignore: cast_nullable_to_non_nullable
              as User,
      isFavorited: null == isFavorited
          ? _value.isFavorited
          : isFavorited // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get userItem {
    return $UserCopyWith<$Res>(_value.userItem, (value) {
      return _then(_value.copyWith(userItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PostItemForViewCopyWith<$Res>
    implements $PostItemForViewCopyWith<$Res> {
  factory _$$_PostItemForViewCopyWith(
          _$_PostItemForView value, $Res Function(_$_PostItemForView) then) =
      __$$_PostItemForViewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String postItemId, String body, User userItem, bool isFavorited});

  @override
  $UserCopyWith<$Res> get userItem;
}

/// @nodoc
class __$$_PostItemForViewCopyWithImpl<$Res>
    extends _$PostItemForViewCopyWithImpl<$Res, _$_PostItemForView>
    implements _$$_PostItemForViewCopyWith<$Res> {
  __$$_PostItemForViewCopyWithImpl(
      _$_PostItemForView _value, $Res Function(_$_PostItemForView) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postItemId = null,
    Object? body = null,
    Object? userItem = null,
    Object? isFavorited = null,
  }) {
    return _then(_$_PostItemForView(
      postItemId: null == postItemId
          ? _value.postItemId
          : postItemId // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      userItem: null == userItem
          ? _value.userItem
          : userItem // ignore: cast_nullable_to_non_nullable
              as User,
      isFavorited: null == isFavorited
          ? _value.isFavorited
          : isFavorited // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PostItemForView implements _PostItemForView {
  const _$_PostItemForView(
      {required this.postItemId,
      required this.body,
      required this.userItem,
      this.isFavorited = false});

  @override
  final String postItemId;
  @override
  final String body;
  @override
  final User userItem;
  @override
  @JsonKey()
  final bool isFavorited;

  @override
  String toString() {
    return 'PostItemForView(postItemId: $postItemId, body: $body, userItem: $userItem, isFavorited: $isFavorited)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostItemForView &&
            (identical(other.postItemId, postItemId) ||
                other.postItemId == postItemId) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.userItem, userItem) ||
                other.userItem == userItem) &&
            (identical(other.isFavorited, isFavorited) ||
                other.isFavorited == isFavorited));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, postItemId, body, userItem, isFavorited);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostItemForViewCopyWith<_$_PostItemForView> get copyWith =>
      __$$_PostItemForViewCopyWithImpl<_$_PostItemForView>(this, _$identity);
}

abstract class _PostItemForView implements PostItemForView {
  const factory _PostItemForView(
      {required final String postItemId,
      required final String body,
      required final User userItem,
      final bool isFavorited}) = _$_PostItemForView;

  @override
  String get postItemId;
  @override
  String get body;
  @override
  User get userItem;
  @override
  bool get isFavorited;
  @override
  @JsonKey(ignore: true)
  _$$_PostItemForViewCopyWith<_$_PostItemForView> get copyWith =>
      throw _privateConstructorUsedError;
}
