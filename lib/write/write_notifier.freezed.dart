// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'write_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WriteState {
  String get text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WriteStateCopyWith<WriteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WriteStateCopyWith<$Res> {
  factory $WriteStateCopyWith(
          WriteState value, $Res Function(WriteState) then) =
      _$WriteStateCopyWithImpl<$Res, WriteState>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class _$WriteStateCopyWithImpl<$Res, $Val extends WriteState>
    implements $WriteStateCopyWith<$Res> {
  _$WriteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WriteStateCopyWith<$Res>
    implements $WriteStateCopyWith<$Res> {
  factory _$$_WriteStateCopyWith(
          _$_WriteState value, $Res Function(_$_WriteState) then) =
      __$$_WriteStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$_WriteStateCopyWithImpl<$Res>
    extends _$WriteStateCopyWithImpl<$Res, _$_WriteState>
    implements _$$_WriteStateCopyWith<$Res> {
  __$$_WriteStateCopyWithImpl(
      _$_WriteState _value, $Res Function(_$_WriteState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$_WriteState(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_WriteState implements _WriteState {
  const _$_WriteState({this.text = ''});

  @override
  @JsonKey()
  final String text;

  @override
  String toString() {
    return 'WriteState(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WriteState &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WriteStateCopyWith<_$_WriteState> get copyWith =>
      __$$_WriteStateCopyWithImpl<_$_WriteState>(this, _$identity);
}

abstract class _WriteState implements WriteState {
  const factory _WriteState({final String text}) = _$_WriteState;

  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$_WriteStateCopyWith<_$_WriteState> get copyWith =>
      throw _privateConstructorUsedError;
}
