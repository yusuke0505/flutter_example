import 'package:flutter_example/user/user_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'name_edit_notifier.freezed.dart';
part 'name_edit_notifier.g.dart';

@freezed
class NameEditState with _$NameEditState {
  const factory NameEditState({
    required String name,
  }) = _NameEditState;
}

@riverpod
class NameEditNotifier extends _$NameEditNotifier {
  @override
  NameEditState build() {
    return NameEditState(name: _userState.user!.name);
  }

  void onNameChanged(String name) {
    state = state.copyWith(name: name.trim());
  }

  Future<bool> post() async {
    return _userNotifier.changeName(state.name);
  }

  UserState get _userState => ref.read(userNotifierProvider).value!;
  UserNotifier get _userNotifier => ref.read(userNotifierProvider.notifier);
}
