// ignore_for_file: unused_import, depend_on_referenced_packages, prefer_final_fields, unused_field, avoid_print, body_might_complete_normally_nullable

import 'package:firebase_auth/firebase_auth.dart';

class Firebase {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Error");
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Error");
    }
    return null;
  }
}
