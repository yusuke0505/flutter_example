import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseStorageRepositoryProvider =
    Provider((_) => FirebaseStorageRepository());

class FirebaseStorageRepository {
  Future<String> updateProfile({
    required File file,
    required String uid,
  }) async {
    final storageRef =
        FirebaseStorage.instance.ref().child('users/$uid/profile.png');
    await storageRef.putFile(file);
    return await storageRef.getDownloadURL();
  }
}
