import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studybuddy/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserModel? _user;

  UserModel? get user => _user;

  bool get isAuthenticated => _user != null;

  Future<void> signUp(String email, String password, String displayName) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? firebaseUser = userCredential.user;
      print('Attempting sign-up with $email and $displayName');
      if (firebaseUser != null) {
        _user = UserModel(
          uid: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          displayName: displayName,
        );
        await _firestore
            .collection('users')
            .doc(firebaseUser.uid)
            .set(_user!.toMap());
        notifyListeners();
      }
    } catch (e) {
      throw Exception("Sign up failed: $e");
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        DocumentSnapshot doc =
            await _firestore.collection('users').doc(firebaseUser.uid).get();
        _user = UserModel.fromMap(doc.data() as Map<String, dynamic>);
        notifyListeners();
      }
    } catch (e) {
      throw Exception('Sign-in failed: $e');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }

  Future<void> checkAuthState() async {
    User? firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(firebaseUser.uid).get();
      _user = UserModel.fromMap(doc.data as Map<String, dynamic>);
      notifyListeners();
    }
  }
}
