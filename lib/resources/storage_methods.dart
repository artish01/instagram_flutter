import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';



class StorageMethods{

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<String> uploadImageToString(String childname,Uint8List file,bool ispost) async {
   Reference ref =  _storage.ref().child(childname).child(_auth.currentUser!.uid);

  //  uploading of ref 
  UploadTask uploadTask = ref.putData(file);
  TaskSnapshot snap =   await uploadTask;
  String downloadUrl = await  snap.ref.getDownloadURL();
  return downloadUrl;




  }
}