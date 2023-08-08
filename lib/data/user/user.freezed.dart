// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserItem {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserItemCopyWith<UserItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserItemCopyWith<$Res> {
  factory $UserItemCopyWith(UserItem value, $Res Function(UserItem) then) =
      _$UserItemCopyWithImpl<$Res, UserItem>;
  @useResult
  $Res call({String uid, String name, String? imagePath});
}

/// @nodoc
class _$UserItemCopyWithImpl<$Res, $Val extends UserItem>
    implements $UserItemCopyWith<$Res> {
  _$UserItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? imagePath = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserItemCopyWith<$Res> implements $UserItemCopyWith<$Res> {
  factory _$$_UserItemCopyWith(
          _$_UserItem value, $Res Function(_$_UserItem) then) =
      __$$_UserItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String name, String? imagePath});
}

/// @nodoc
class __$$_UserItemCopyWithImpl<$Res>
    extends _$UserItemCopyWithImpl<$Res, _$_UserItem>
    implements _$$_UserItemCopyWith<$Res> {
  __$$_UserItemCopyWithImpl(
      _$_UserItem _value, $Res Function(_$_UserItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? imagePath = freezed,
  }) {
    return _then(_$_UserItem(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UserItem extends _UserItem {
  const _$_UserItem(
      {required this.uid, this.name = defaultName, this.imagePath})
      : super._();

  @override
  final String uid;
  @override
  @JsonKey()
  final String name;
  @override
  final String? imagePath;

  @override
  String toString() {
    return 'UserItem(uid: $uid, name: $name, imagePath: $imagePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserItem &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid, name, imagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserItemCopyWith<_$_UserItem> get copyWith =>
      __$$_UserItemCopyWithImpl<_$_UserItem>(this, _$identity);
}

abstract class _UserItem extends UserItem {
  const factory _UserItem(
      {required final String uid,
      final String name,
      final String? imagePath}) = _$_UserItem;
  const _UserItem._() : super._();

  @override
  String get uid;
  @override
  String get name;
  @override
  String? get imagePath;
  @override
  @JsonKey(ignore: true)
  _$$_UserItemCopyWith<_$_UserItem> get copyWith =>
      throw _privateConstructorUsedError;
}
