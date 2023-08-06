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
    required this.name,
    required this.body,
    required this.imagePath,
  });

  final String name;
  final String body;
  final String imagePath;
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
            name: 'name3',
            body: 'body3',
            imagePath: imagePath,
          ),
          PostItem(
            name: 'name2',
            body: 'body2',
            imagePath: imagePath,
          ),
          PostItem(
            name: 'name1',
            body: 'body1',
            imagePath: imagePath,
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
          name: _userState.userItem.name,
          body: body,
          imagePath: '',
        ),
        ...state.postItems,
      ],
    );
  }

  final Ref _ref;
  UserState get _userState => _ref.read(userNotifierProvider);
}
