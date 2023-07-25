// import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_flutter/models/user.dart' as model;
import 'package:flutter/foundation.dart';

import 'package:instagram_flutter/resources/storage_methods.dart';
 
class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


   // get user details
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }


  // signup the user

  Future<String>? signUpUser({
    required String username,
    required String bio,
    required Uint8List file,
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty ||
          username.isNotEmpty) {
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photoUrl = await StorageMethods()
            .uploadImageToString('profilepics', file, false);

        model.User user = model.User(
          email: email,
          username: username,
          bio: bio,
          uid: cred.user!.uid,
          followers: [],
          following: [],
          photoUrl: photoUrl,

        );

        // add user to database
        await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());
        res = 'success';
      }
    } 
    catch (err) 
    {
      res = err.toString();
    }
     
    return res;
  }

  // logging in user similar to signin

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = "Please fill all details";
      }
    } catch (e) {
      res = e.toString();
    }
     
    return res;
  }
}
