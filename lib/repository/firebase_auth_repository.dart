import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firebaseAuthRepositoryProvider =
    Provider((_) => FirebaseAuthRepository());

class FirebaseAuthRepository {
  final _instance = FirebaseAuth.instance;
  User? get currentUser => _instance.currentUser;

  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on Exception {
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on Exception {
      return null;
    }
  }

  Future<bool> signOut() async {
    try {
      await _instance.signOut();
      return true;
    } on Exception {
      return false;
    }
  }
}
