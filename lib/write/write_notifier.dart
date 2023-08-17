import 'package:flutter_example/data/post_item/post_item.dart';
import 'package:flutter_example/home/home_notifier.dart';
import 'package:flutter_example/user/user_notifier.dart';
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

  Future<void> post() async {
    final item = PostItem(
      body: state.text,
      userItem: _userState.user!,
    );
    _homeNotifier.post(item);
  }

  HomeNotifier get _homeNotifier => ref.read(homeNotifierProvider.notifier);
  UserState get _userState => ref.read(userNotifierProvider).value!;
}
