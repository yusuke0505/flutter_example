import 'package:flutter_example/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String uid,
    @Default(defaultName) String name,
    String? imagePath,
  }) = _User;
  const User._();

  factory User.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return User(
      uid: data?['uid'],
      name: data?['name'],
      imagePath: data?['image_path'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "uid": uid,
      "name": name,
      "image_path": imagePath,
    };
  }

  factory User.generate({required String uid}) {
    return User(
      uid: uid,
      imagePath: _storageImagePath(uid),
    );
  }

  String get storageImagePath => _storageImagePath(uid);

  static String _storageImagePath(String uid) => 'users/$uid/profile.png';
}
