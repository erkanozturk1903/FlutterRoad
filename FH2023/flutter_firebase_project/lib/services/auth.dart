import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<User> signInAnonymously() async {
    final userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user!;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<User?> authStatusChanges() => _firebaseAuth.authStateChanges();
}
