import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign Up User using email and password only.
  Future<String> signUpUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    try {
      // Check that both email and password are provided.
      if (email.isNotEmpty && password.isNotEmpty) {
        // Register user with Firebase Auth.
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // Add user details to Firestore.
        await _firestore.collection("users").doc(cred.user!.uid).set({
          'uid': cred.user!.uid,
          'email': email,
        });
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Log In User using email and password.
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    try {
      // Ensure both fields are filled.
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Sign out the current user.
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
