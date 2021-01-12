import 'package:firebase_auth/firebase_auth.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class Auth {
  final auth = FirebaseAuth.instance;
  bool status = true;
  Future<bool> signUp(String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    //FirebaseUser user = authResult.user;
    return true;
  }

  Future<bool> signIn(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
    return true;
  }

  Future<FirebaseUser> getUser() async {
    return await auth.currentUser();
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
