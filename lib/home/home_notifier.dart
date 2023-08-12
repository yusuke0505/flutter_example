import 'dart:async';

import 'package:flutter_example/data/user/user.dart';
import 'package:flutter_example/user/user_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'home_notifier.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(true) bool loading,
    @Default(<PostItem>[]) List<PostItem> postItems,
  }) = _HomeState;
}

class PostItem {
  const PostItem({
    required this.body,
    required this.userItem,
  });

  final String body;
  final User userItem;
}

final homeNotifierProvider =
    AsyncNotifierProvider<HomeNotifier, HomeState>(HomeNotifier.new);

class HomeNotifier extends AsyncNotifier<HomeState> {
  @override
  FutureOr<HomeState> build() async {
    final items = await fetch();
    return HomeState(postItems: items);
  }

  Future<List<PostItem>> fetch() async {
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
      ),
      PostItem(
        body: 'body2',
        userItem: User(
          uid: '',
          name: 'name2',
          imagePath: imagePath,
        ),
      ),
      PostItem(
        body: 'body1',
        userItem: User(
          uid: '',
          name: 'name1',
          imagePath: imagePath,
        ),
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

  Future<void> post(String body) async {
    final value = state.value!;
    state = AsyncValue.data(
      value.copyWith(
        postItems: [
          PostItem(
            body: body,
            userItem: _userState.user!,
          ),
          ...value.postItems,
        ],
      ),
    );
  }

  UserState get _userState => ref.read(userNotifierProvider);
}
