import 'dart:async';

import 'package:flutter_example/data/user/user.dart';
import 'package:flutter_example/repository/post_item_repository.dart';
import 'package:flutter_example/repository/user_item_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_notifier.freezed.dart';
part 'home_notifier.g.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required List<PostItemForView> postItems,
  }) = _HomeState;
}

class PostItemForView {
  const PostItemForView({
    required this.body,
    required this.userItem,
  });

  final String body;
  final User userItem;
}

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  FutureOr<HomeState> build() async {
    final items = await fetch();
    return HomeState(postItems: items);
  }

  Future<List<PostItemForView>> fetch() async {
    final items = await _postItemRepository.fetchList();
    if (items == null) {
      //TODO エラー処理
      return [];
    }
    final list = <PostItemForView>[];
    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      final userItem = await _userItemRepository.fetch(item.userId);
      if (userItem != null) {
        list.add(
          PostItemForView(
            body: item.body,
            userItem: userItem,
          ),
        );
      }
    }
    return list;
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final items = await fetch();
    state = AsyncValue.data(
      state.value!.copyWith(postItems: items),
    );
  }

  Future<void> post(PostItemForView item) async {
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
  UserItemRepository get _userItemRepository =>
      ref.watch(userItemRepositoryProvider);
}
