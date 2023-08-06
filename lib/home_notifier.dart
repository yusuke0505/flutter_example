import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'home_notifier.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(true) bool loading,
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
    Future.delayed(const Duration(seconds: 3))
        .then((_) => state = state.copyWith(loading: false));
  }

  Future<void> refresh() async {
    state = state.copyWith(loading: true);
    fetch();
  }

  final Ref _ref;
}
