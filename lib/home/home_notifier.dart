import 'dart:async';

import 'package:flutter_example/data/post_item/post_item.dart';
import 'package:flutter_example/data/user/user.dart';
import 'package:flutter_example/repository/post_item_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_notifier.freezed.dart';
part 'home_notifier.g.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required List<PostItem> postItems,
  }) = _HomeState;
}

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  FutureOr<HomeState> build() async {
    final items = await fetch();
    return HomeState(postItems: items);
  }

  Future<List<PostItem>> fetch() async {
    final items = await _postItemRepository.fetchList();
    if (items == null) {
      //TODO エラー処理
    }
    const imagePath =
        'https://www.barrel365.com/wp-content/uploads/2019/12/livet-1.jpg';
    await Future.delayed(const Duration(seconds: 1));
    return const [
      PostItem(
        body: 'body3',
        userItem: User(
          uid: '',
          name: 'name3',
          imagePath: imagePath,
        ),
        userId: '',
      ),
      PostItem(
        body: 'body2',
        userItem: User(
          uid: '',
          name: 'name2',
          imagePath: imagePath,
        ),
        userId: '',
      ),
      PostItem(
        body: 'body1',
        userItem: User(
          uid: '',
          name: 'name1',
          imagePath: imagePath,
        ),
        userId: '',
      ),
    ];
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final items = await fetch();
    state = AsyncValue.data(
      state.value!.copyWith(postItems: items),
    );
  }

  Future<void> post(PostItem item) async {
    final value = state.value!;
    state = AsyncValue.data(
      value.copyWith(
        postItems: [
          item,
          ...value.postItems,
        ],
      ),
    );
  }

  PostItemRepository get _postItemRepository =>
      ref.watch(postItemRepositoryProvider);
}
