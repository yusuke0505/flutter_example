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
    StateNotifierProvider.autoDispose<NameEditNotifier, NameEditState>(
        (ref) => NameEditNotifier(ref));

class NameEditNotifier extends StateNotifier<NameEditState> {
  NameEditNotifier(this._ref) : super(const NameEditState());

  Future<void> fetch() async {
    Future.delayed(const Duration(seconds: 1)).then(
      (_) => state = state.copyWith(
        loading: false,
        name: _userState.name,
      ),
    );
  }

  void onNameChanged(String name) {
    state = state.copyWith(name: name.trim());
  }

  void post() {
    _userNotifier.changeName(state.name);
  }

  final Ref _ref;
  UserState get _userState => _ref.read(userNotifierProvider);
  UserNotifier get _userNotifier => _ref.read(userNotifierProvider.notifier);
}
