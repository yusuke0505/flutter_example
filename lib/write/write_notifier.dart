import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'write_notifier.freezed.dart';

@freezed
class WriteState with _$WriteState {
  const factory WriteState({
    @Default('') String text,
  }) = _WriteState;
}

final writeNotifierProvider =
    AutoDisposeNotifierProvider<WriteNotifier, WriteState>(WriteNotifier.new);

class WriteNotifier extends AutoDisposeNotifier<WriteState> {
  @override
  WriteState build() {
    return const WriteState();
  }

  void onTextChanged(String text) {
    state = state.copyWith(text: text.trim());
  }
}
