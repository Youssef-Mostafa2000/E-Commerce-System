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
  group('user repository test', () {
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
      final _authresult = await auth.signIn("email", "password");
      expect(_authresult, !null);
      //expect(auth.status, Status.Authenticated);
    });

    test("sing in fails with incorrect email and password", () async {
      final _authresult = await auth.signIn("mail", "pass");
      expect(_authresult, !null);
      //expect(_repo.status, Status.Unauthenticated);
    });

    test('sign out', () async {
      final _authresult = await auth.signOut();
      //print(_authresult);
      //expect(_authresult, false);
    });
  });
}
