import 'package:firebase_auth/firebase_auth.dart';

class AuthHandler{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthResult result;
  static FirebaseUser user;
  Future<bool> createEmailUser(String email , String password) async {
    result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    user = result.user;
    if (user != null){
      return true;
    }
    else{
      return false;
    }
  }
  Future<bool> signInEmailUser(String email , String password) async {
    result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    user = result.user;
    if (user != null){
      return true;
    }
    else{
      return false;
    }
  }
  signOutUser() async {
    await _auth.signOut();
  }
}