import 'package:flutter_example/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'user_notifier.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(defaultName) String name,
  }) = _UserState;
}

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, UserState>((ref) => UserNotifier(ref));

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier(this._ref) : super(const UserState());

  final Ref _ref;
}
