import 'package:flutter_example/data/user_item/user_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'user_notifier.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    User? user,
    @Default(UserItem()) UserItem userItem,
  }) = _UserState;
}

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, UserState>((ref) => UserNotifier(ref));

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier(this._ref) : super(const UserState());

  Future<void> fetchUser() async {
    state = state.copyWith(user: FirebaseAuth.instance.currentUser);
  }

  void changeName(String name) {
    state = state.copyWith(userItem: state.userItem.copyWith(name: name));
  }

  final Ref _ref;
}
