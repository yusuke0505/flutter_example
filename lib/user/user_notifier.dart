import 'package:flutter_example/data/user/user.dart';
import 'package:flutter_example/repository/firebase_auth_repository.dart';
import 'package:flutter_example/repository/user_item_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'user_notifier.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    UserItem? user,
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
    final user = await _userItemRepository.fetch(authUser.uid);
    state = state.copyWith(user: user);
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
      final user = UserItem(uid: authUser.uid);
      await _userItemRepository.create(user);
      state = state.copyWith(user: user);
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
      final user = await _userItemRepository.fetch(authUser.uid);
      state = state.copyWith(user: user);
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
    final user = state.user!;
    state = state.copyWith(user: user.copyWith(name: name));
    await _userItemRepository.update(user);
  }

  final Ref _ref;
  UserItemRepository get _userItemRepository =>
      _ref.read(userItemRepositoryProvider);
  FirebaseAuthRepository get _firebaseAuthRepository =>
      _ref.read(firebaseAuthRepositoryProvider);
}
