import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_example/data/user/user.dart';
import 'package:flutter_example/repository/firebase_auth_repository.dart';
import 'package:flutter_example/repository/user_item_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_notifier.freezed.dart';
part 'user_notifier.g.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    User? user,
  }) = _UserState;
}

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  @override
  FutureOr<UserState> build() async {
    final user = await fetchUser();
    return UserState(user: user);
  }

  Future<User?> fetchUser() async {
    final authUser = _firebaseAuthRepository.currentUser;
    if (authUser == null) {
      return null;
    }
    final user = await _userItemRepository.fetch(authUser.uid);
    if (user == null) {
      /// FIXME FirebaseAuthには登録できてるけどFirestoreには登録できていない不整合状態
      /// 対象のメールアドレスでは新規登録もログインもできない状態
      return null;
    }
    return user;
  }

  Future<bool> createUser({
    required String email,
    required String password,
  }) async {
    final authUser =
        await _firebaseAuthRepository.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (authUser == null) {
      return false;
    }
    final user = User(uid: authUser.uid);
    final result = await _userItemRepository.create(user);
    if (result) {
      state = AsyncValue.data(
        state.value!.copyWith(user: user),
      );
      return true;
    } else {
      /// FIXME FirebaseAuthには登録できてるけどFirestoreには登録できていない不整合状態
      /// 対象のメールアドレスでは新規登録もログインもできない状態
      return false;
    }
  }

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    final authUser = await _firebaseAuthRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (authUser == null) {
      return false;
    }
    final user = await _userItemRepository.fetch(authUser.uid);
    if (user == null) {
      /// FIXME FirebaseAuthには登録できてるけどFirestoreには登録できていない不整合状態
      /// 対象のメールアドレスでは新規登録もログインもできない状態
      return false;
    }
    state = AsyncValue.data(
      state.value!.copyWith(user: user),
    );
    return true;
  }

  Future<bool> signOut() async {
    final result = await _firebaseAuthRepository.signOut();
    if (result) {
      state = AsyncValue.data(state.value!.copyWith(user: null));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateName(String name) async {
    final value = state.value!;
    final user = value.user!.copyWith(name: name);
    final result = await _userItemRepository.update(user);
    if (result) {
      state = AsyncValue.data(
        value.copyWith(user: user),
      );
      return true;
    } else {
      return false;
    }
  }

  Future<void> updateProfile(XFile image) async {
    final value = state.value!;
    final user = value.user!;
    final storageRef =
        FirebaseStorage.instance.ref().child('users/${user.uid}/profile.png');
    await storageRef.putFile(File(image.path));
    final imagePath = await storageRef.getDownloadURL();
    state = AsyncValue.data(
      value.copyWith(user: user.copyWith(imagePath: imagePath)),
    );
  }

  UserItemRepository get _userItemRepository =>
      ref.read(userItemRepositoryProvider);
  FirebaseAuthRepository get _firebaseAuthRepository =>
      ref.read(firebaseAuthRepositoryProvider);
}
