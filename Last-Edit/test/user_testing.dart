import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:c_e_commerce/services/auth.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

class MockAuthResult extends Mock implements AuthResult {}

void main() {
  MockFirebaseAuth _auth = MockFirebaseAuth();
  BehaviorSubject<MockFirebaseUser> _user = BehaviorSubject<MockFirebaseUser>();
  when(_auth.onAuthStateChanged).thenAnswer((_) {
    return _user;
  });
  final auth = Auth();
  group('user authentication test', () {
    when(_auth.signInWithEmailAndPassword(email: "email", password: "password"))
        .thenAnswer((_) async {
      _user.add(MockFirebaseUser());
      return MockAuthResult();
    });
    when(_auth.signInWithEmailAndPassword(email: "mail", password: "pass"))
        .thenThrow(() {
      return null;
    });
    test("sign in with email and password", () async {
      bool _authresult = await auth.signIn("email", "password");
      expect(_authresult, true);
    });

    test("sing in fails with incorrect email and password", () async {
      bool _authresult = await auth.signIn("mail", "pass");
      expect(_authresult, false);
    });
  });
}
