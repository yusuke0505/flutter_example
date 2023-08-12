import 'package:flutter_example/constants.dart';
import 'package:flutter_example/user/user_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'name_edit_notifier.freezed.dart';

@freezed
class NameEditState with _$NameEditState {
  const factory NameEditState({
    @Default(true) bool loading,
    @Default(defaultName) String name,
  }) = _NameEditState;
}

final nameEditNotifierProvider =
    AutoDisposeNotifierProvider<NameEditNotifier, NameEditState>(
        NameEditNotifier.new);

class NameEditNotifier extends AutoDisposeNotifier<NameEditState> {
  @override
  NameEditState build() {
    return const NameEditState();
  }

  Future<void> fetch() async {
    Future.delayed(const Duration(seconds: 1)).then(
      (_) => state = state.copyWith(
        loading: false,
        name: _userState.user!.name,
      ),
    );
  }

  void onNameChanged(String name) {
    state = state.copyWith(name: name.trim());
  }

  Future<bool> post() async {
    return _userNotifier.changeName(state.name);
  }

  UserState get _userState => ref.read(userNotifierProvider);
  UserNotifier get _userNotifier => ref.read(userNotifierProvider.notifier);
}
