import 'package:flutter_example/user/user_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'name_edit_notifier.freezed.dart';

@freezed
class NameEditState with _$NameEditState {
  const factory NameEditState({
    required String name,
  }) = _NameEditState;
}

final nameEditNotifierProvider =
    AutoDisposeNotifierProvider<NameEditNotifier, NameEditState>(
        NameEditNotifier.new);

class NameEditNotifier extends AutoDisposeNotifier<NameEditState> {
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
