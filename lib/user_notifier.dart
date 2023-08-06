import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_notifier.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default('名前未設定') String name,
  }) = _UserState;
}
