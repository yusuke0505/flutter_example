// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'name_edit_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NameEditState {
  bool get loading => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NameEditStateCopyWith<NameEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameEditStateCopyWith<$Res> {
  factory $NameEditStateCopyWith(
          NameEditState value, $Res Function(NameEditState) then) =
      _$NameEditStateCopyWithImpl<$Res, NameEditState>;
  @useResult
  $Res call({bool loading, String name});
}

/// @nodoc
class _$NameEditStateCopyWithImpl<$Res, $Val extends NameEditState>
    implements $NameEditStateCopyWith<$Res> {
  _$NameEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NameEditStateCopyWith<$Res>
    implements $NameEditStateCopyWith<$Res> {
  factory _$$_NameEditStateCopyWith(
          _$_NameEditState value, $Res Function(_$_NameEditState) then) =
      __$$_NameEditStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, String name});
}

/// @nodoc
class __$$_NameEditStateCopyWithImpl<$Res>
    extends _$NameEditStateCopyWithImpl<$Res, _$_NameEditState>
    implements _$$_NameEditStateCopyWith<$Res> {
  __$$_NameEditStateCopyWithImpl(
      _$_NameEditState _value, $Res Function(_$_NameEditState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? name = null,
  }) {
    return _then(_$_NameEditState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NameEditState implements _NameEditState {
  const _$_NameEditState({this.loading = true, this.name = '名前未設定'});

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'NameEditState(loading: $loading, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NameEditState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NameEditStateCopyWith<_$_NameEditState> get copyWith =>
      __$$_NameEditStateCopyWithImpl<_$_NameEditState>(this, _$identity);
}

abstract class _NameEditState implements NameEditState {
  const factory _NameEditState({final bool loading, final String name}) =
      _$_NameEditState;

  @override
  bool get loading;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_NameEditStateCopyWith<_$_NameEditState> get copyWith =>
      throw _privateConstructorUsedError;
}
