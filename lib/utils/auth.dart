import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  // Anon sign in

  Future signIn(Map<String, String> formData) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: formData["email"].trim(), password: formData["password"]);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      return null;
    }
  }

  Future signUp(Map formData) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: formData["email"].trim(), password: formData["password"]);
      FirebaseUser user = result.user;
      if (user != null) {
        _firestore
            .collection('profiles')
            .document(user.email)
            .setData({"phone_number": formData["phone_number"]});
      }
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
