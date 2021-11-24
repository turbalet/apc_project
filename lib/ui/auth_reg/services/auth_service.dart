import 'package:apc_project/ui/auth_reg/services/models/user.dart';
import 'package:apc_project/ui/home/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<void> googleSignIn(BuildContext context) async {
    try {
      await _googleSignIn.signIn();
      Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (builder) => HomePage()),
                (route) => false);
    } catch (e) {
      print("here---->");
      print(e);
    }
  }


  Future<UserModel?> signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return UserModel.fromFirebase(user!);
    }catch(e){
      print(e);
      return null;
    }
  }

  Future<UserModel?> registerWithEmailAndPassword(String email, String password) async{
    try{
      final firestoreInstance = FirebaseFirestore.instance;
      UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      try {
        firestoreInstance.collection("progresses").doc(user!.uid).set(
            {
              "unit": "1.1",
              "score": 0
            }
        ).then((_) {
          print("success!");
        });
      }catch(e) {
        print("error creating progress");
      }
      return UserModel.fromFirebase(user!);
    }catch(e){
      print(e);
      return null;
    }
  }

  Future logOut() async{
    await _firebaseAuth.signOut();
  }

  String get currentUserId{
    final User? user = _firebaseAuth.currentUser;
    try{
      if(user!.uid != null) {
        final uid = user.uid;
        print(uid);
        return uid;
      }
    }catch(e){
      print(e);
    }

    return 'no';

  }
}