import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

  // Sign in with Google
  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      print("Google sign in account: $googleSignInAccount"); // Debug print

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await auth.signInWithCredential(authCredential);
        print("User signed in with Google");
      } else {
        print("Google sign-in was cancelled.");
      }
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.toString()}");
    } catch (e) {
      print("Error during Google sign-in: ${e.toString()}");
    }
  }

  // For sign out
  googleSignOut() async {
    await googleSignIn.signOut();
    await auth.signOut();
  }
}
