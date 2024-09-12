import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthServices {
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<void> signInWithGoogle() async {
    signOut();
    final userDetails = await _googleSignIn.signIn();

    if (userDetails != null) {
      final googleAuthDetails = await userDetails.authentication;
      final credntials = GoogleAuthProvider.credential(
          accessToken: googleAuthDetails.accessToken,
          idToken: googleAuthDetails.idToken);
      await FirebaseAuth.instance.signInWithCredential(credntials);
    }
  }

  static Future<void> signOut() async {
    if (await _googleSignIn.isSignedIn()) {
      await _googleSignIn.signOut();
    }
  }
}
