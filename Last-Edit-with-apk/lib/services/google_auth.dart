import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

String name;
String google_email;
final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth auth_google = FirebaseAuth.instance;
Future<void> signInWithGoogle() async {
  GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
  AuthCredential authCredential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);
  AuthResult authResult =
      await auth_google.signInWithCredential(authCredential);
  FirebaseUser user = await auth_google.currentUser();
  print('user email = ${user.email}');
  if (user != null) {
    // Add the following lines after getting the user
    // Checking if email and name is null
    assert(user.email != null);
    assert(user.displayName != null);

    // Store the retrieved data
    name = user.displayName;
    google_email = user.email;

    // Only taking the first part of the name, i.e., First Name
    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }
  }
}

Future<void> signOut() async {
  await _googleSignIn.signOut();
  print('sign out');
}
