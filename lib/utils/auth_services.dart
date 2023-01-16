import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static FirebaseAuth get getAuth => _auth;

  static Stream<User?> authStateChange() {
    return _auth.authStateChanges();
  }

  static User? authCurrentUser() {
    return _auth.currentUser;
  }

  static Future<void> authSignOut() {
    return _auth.signOut();
  }

  static AuthCredential getCredential(String verificationId, String smsCode) {
    AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    return credential;
  }
}
