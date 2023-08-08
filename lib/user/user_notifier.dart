import 'package:flutter_example/data/user_item/user_item.dart';
import 'package:flutter_example/repository/firebase_auth_repository.dart';
import 'package:flutter_example/repository/user_item_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'user_notifier.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    User? user,
    @Default(UserItem(uid: '')) UserItem userItem,
  }) = _UserState;
}

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, UserState>((ref) => UserNotifier(ref));

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier(this._ref) : super(const UserState());

  Future<void> fetchUser() async {
    final authUser = _firebaseAuthRepository.currentUser;
    if (authUser == null) {
      return;
    }
    final userItem = await _userItemRepository.fetch(authUser.uid);
    state = state.copyWith(
      user: authUser,
      userItem: userItem,
    );
  }

  Future<bool> createUser({
    required String email,
    required String password,
  }) async {
    try {
      final authUser =
          await _firebaseAuthRepository.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authUser == null) {
        return false;
      }
      final userItem = UserItem(uid: authUser.uid);
      await _userItemRepository.create(userItem);
      state = state.copyWith(
        user: authUser,
        userItem: userItem,
      );
      return true;
    } catch (e) {
      // TODO(you):Authのデータ作成が成功してFireStoreのデータ作成が失敗した時の処理を考える
      return false;
    }
  }

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final authUser = await _firebaseAuthRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authUser == null) {
        return false;
      }
      final userItem = await _userItemRepository.fetch(authUser.uid);
      state = state.copyWith(
        user: authUser,
        userItem: userItem,
      );
      return true;
    } catch (e) {
      // TODO(you):Authのデータ作成が成功してFireStoreのデータ作成が失敗した時の処理を考える
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await _firebaseAuthRepository.signOut();
      state = state.copyWith(user: null);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> changeName(String name) async {
    state = state.copyWith(userItem: state.userItem.copyWith(name: name));
    await _userItemRepository.update(state.userItem);
  }

  final Ref _ref;
  UserItemRepository get _userItemRepository =>
      _ref.read(userItemRepositoryProvider);
  FirebaseAuthRepository get _firebaseAuthRepository =>
      _ref.read(firebaseAuthRepositoryProvider);
}
