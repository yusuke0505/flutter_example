import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'write_notifier.freezed.dart';

@freezed
class WriteState with _$WriteState {
  const factory WriteState({
    @Default('') String text,
  }) = _WriteState;
}

final writeNotifierProvider = StateNotifierProvider<WriteNotifier, WriteState>(
    (ref) => WriteNotifier(ref));

class WriteNotifier extends StateNotifier<WriteState> {
  WriteNotifier(this._ref) : super(const WriteState());

  void onTextChanged(String text) {
    state = state.copyWith(text: text);
  }

  final Ref _ref;
}
