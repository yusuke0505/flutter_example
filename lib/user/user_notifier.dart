import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_example/data/user_item/user_item.dart';
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
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    state = state.copyWith(
      user: user,
      userItem: UserItem.fromFirestore(snapshot, null),
    );
  }

  Future<bool> createUser({
    required String email,
    required String password,
  }) async {
    try {
      final user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      if (user == null) {
        return false;
      }
      final docRef = FirebaseFirestore.instance
          .collection("users")
          .doc(state.user!.uid)
          .withConverter(
            fromFirestore: UserItem.fromFirestore,
            toFirestore: (user, _) => user.toFirestore(),
          );
      state = state.copyWith(
        user: user,
        userItem: state.userItem.copyWith(uid: user.uid),
      );
      await docRef.set(state.userItem);
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
      final user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      if (user == null) {
        return false;
      }
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      state = state.copyWith(
        user: user,
        userItem: UserItem.fromFirestore(snapshot, null),
      );
      return true;
    } catch (e) {
      // TODO(you):Authのデータ作成が成功してFireStoreのデータ作成が失敗した時の処理を考える
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      state = state.copyWith(user: null);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> changeName(String name) async {
    final docRef = FirebaseFirestore.instance
        .collection("users")
        .doc(state.userItem.uid)
        .withConverter(
          fromFirestore: UserItem.fromFirestore,
          toFirestore: (user, _) => user.toFirestore(),
        );
    state = state.copyWith(userItem: state.userItem.copyWith(name: name));
    await docRef.set(state.userItem);
  }

  final Ref _ref;
}
