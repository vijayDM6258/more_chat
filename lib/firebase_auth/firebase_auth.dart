import 'package:firebase_auth/firebase_auth.dart';

class Firebase {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User?> SignUpWithEmail(String Email, String Password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: Email, password: Password);
      return userCredential.user;
    } catch (e) {
      print("Something went wrong");
    }
    return null;
  }


  Future<User?> LoginWithEmail(String Email, String Password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: Email, password: Password);
      return userCredential.user;
    } catch (e) {
      print("Login Failed");
    }
    return null;
  }
}
