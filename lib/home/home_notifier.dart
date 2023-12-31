import 'dart:async';

import 'package:flutter_example/data/favorite/favorite.dart';
import 'package:flutter_example/data/post_item_for_view/post_item_for_view.dart';
import 'package:flutter_example/functions.dart';
import 'package:flutter_example/repository/firestore/favorite_repository.dart';
import 'package:flutter_example/repository/firestore/post_item_repository.dart';
import 'package:flutter_example/repository/firestore/user_item_repository.dart';
import 'package:flutter_example/user/user_notifier.dart';
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
            postItemId: item.id,
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

  // TODO(you): バックエンド作って永続化する
  Future<bool> toggleFavorite(PostItemForView item) async {
    if (item.isFavorited) {
      // お気に入りを外す
      final favorite = await _favoriteRepository.fetch(
        userId: _userState.user!.uid,
        postItemId: item.postItemId,
      );
      if (favorite == null) {
        return false;
      }
      final result = await _favoriteRepository.delete(favorite);
      if (!result) {
        return false;
      }
    } else {
      // お気に入りをする
      final result = await _favoriteRepository.create(
        Favorite(
          postItemId: item.postItemId,
          fromUserId: _userState.user!.uid,
          id: generateRandomString(),
        ),
      );
      if (!result) {
        return false;
      }
    }
    final value = state.value!;
    final postItems = value.postItems
        .map((e) =>
            e == item ? item.copyWith(isFavorited: !item.isFavorited) : e)
        .toList();
    state = AsyncValue.data(
      value.copyWith(postItems: postItems),
    );
    return true;
  }

  PostItemRepository get _postItemRepository =>
      ref.watch(postItemRepositoryProvider);
  UserItemRepository get _userItemRepository =>
      ref.watch(userItemRepositoryProvider);
  FavoriteRepository get _favoriteRepository =>
      ref.watch(favoriteRepositoryProvider);
  UserState get _userState => ref.read(userNotifierProvider).value!;
}
