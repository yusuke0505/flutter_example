import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_notifier.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(true) bool loading,
  }) = _HomeState;
}
