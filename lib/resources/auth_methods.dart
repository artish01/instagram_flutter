// import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance; 
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  


  // signup the user

  Future<String>? signUpUser({
    required String username,
    required String bio,
    // required Uint8List file,
    required String email,
    required String password,
    })async  {

      String res = "Some error occured";

      try{
        if(email.isNotEmpty || password.isNotEmpty || bio.isNotEmpty || username.isNotEmpty)
        {
          // auth area
          UserCredential cred  = await  _auth.createUserWithEmailAndPassword(email: email, password: password);
          
          // saving value to firestore
          await _firestore.collection('users').doc(cred.user!.uid).set({
            'email': email,
            'username':username,
            'bio':bio,
            'uid':cred.user!.uid,
            'followers': [],
            'following' : [],

          });

          res = "success";   
        }
      }
      catch(err)
      {
        res = err.toString(); 
      }
    return res;

    }
}