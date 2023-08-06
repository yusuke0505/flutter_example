import 'package:flutter_example/data/user_item/user_item.dart';
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
  final UserItem userItem;
}

final homeNotifierProvider =
    StateNotifierProvider<HomeNotifier, HomeState>((ref) => HomeNotifier(ref));

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier(this._ref) : super(const HomeState());

  Future<void> fetch() async {
    const imagePath =
        'https://www.barrel365.com/wp-content/uploads/2019/12/livet-1.jpg';
    Future.delayed(const Duration(seconds: 1)).then(
      (_) => state = state.copyWith(
        loading: false,
        postItems: const [
          PostItem(
            body: 'body3',
            userItem: UserItem(
              name: 'name3',
              imagePath: imagePath,
            ),
          ),
          PostItem(
            body: 'body2',
            userItem: UserItem(
              name: 'name2',
              imagePath: imagePath,
            ),
          ),
          PostItem(
            body: 'body1',
            userItem: UserItem(
              name: 'name1',
              imagePath: imagePath,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> refresh() async {
    state = state.copyWith(loading: true);
    fetch();
  }

  Future<void> post(String body) async {
    state = state.copyWith(
      postItems: [
        PostItem(
          body: body,
          userItem: _userState.userItem,
        ),
        ...state.postItems,
      ],
    );
  }

  final Ref _ref;
  UserState get _userState => _ref.read(userNotifierProvider);
}
