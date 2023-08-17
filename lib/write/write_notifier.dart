import 'package:flutter_example/data/post_item/post_item.dart';
import 'package:flutter_example/data/post_item_for_view/post_item_for_view.dart';
import 'package:flutter_example/functions.dart';
import 'package:flutter_example/home/home_notifier.dart';
import 'package:flutter_example/repository/firestore/post_item_repository.dart';
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

  Future<bool> post() async {
    final user = _userState.user!;
    final item = PostItem(
      body: state.text,
      userId: user.uid,
      id: generateRandomString(),
    );
    final result = await _postItemRepository.create(item);
    if (!result) {
      return false;
    }
    _homeNotifier.post(
      PostItemForView(
        postItemId: item.id,
        body: item.body,
        userItem: user,
      ),
    );
    return true;
  }

  HomeNotifier get _homeNotifier => ref.read(homeNotifierProvider.notifier);
  UserState get _userState => ref.read(userNotifierProvider).value!;
  PostItemRepository get _postItemRepository =>
      ref.read(postItemRepositoryProvider);
}
