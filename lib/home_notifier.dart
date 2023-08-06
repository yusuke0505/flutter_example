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
  });

  final String name;
  final String body;
}

final homeNotifierProvider =
    StateNotifierProvider<HomeNotifier, HomeState>((ref) => HomeNotifier(ref));

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier(this._ref) : super(const HomeState());

  Future<void> fetch() async {
    Future.delayed(const Duration(seconds: 3)).then(
      (_) => state = state.copyWith(
        loading: false,
        postItems: const [
          PostItem(name: 'name1', body: 'body1'),
          PostItem(name: 'name2', body: 'body2'),
          PostItem(name: 'name3', body: 'body3'),
        ],
      ),
    );
  }

  Future<void> refresh() async {
    state = state.copyWith(loading: true);
    fetch();
  }

  final Ref _ref;
}
