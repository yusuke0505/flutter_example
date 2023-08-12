import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'write_notifier.freezed.dart';
part 'write_notifier.g.dart';

@freezed
class WriteState with _$WriteState {
  const factory WriteState({
    @Default('') String text,
  }) = _WriteState;
}

@riverpod
class WriteNotifier extends _$WriteNotifier {
  @override
  WriteState build() {
    return const WriteState();
  }

  void onTextChanged(String text) {
    state = state.copyWith(text: text.trim());
  }
}
