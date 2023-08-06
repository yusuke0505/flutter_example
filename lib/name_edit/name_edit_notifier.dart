import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'name_edit_notifier.freezed.dart';

@freezed
class NameEditState with _$NameEditState {
  const factory NameEditState({
    @Default('名前未設定') String name,
  }) = _NameEditState;
}

final nameEditNotifierProvider =
    StateNotifierProvider.autoDispose<NameEditNotifier, NameEditState>(
        (ref) => NameEditNotifier(ref));

class NameEditNotifier extends StateNotifier<NameEditState> {
  NameEditNotifier(this._ref) : super(const NameEditState());

  void onTextChanged(String text) {
    //state = state.copyWith(text: text.trim());
  }

  final Ref _ref;
}
