import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interview_app/models/cat_breed.dart';

class LikeUtil {
  static Future<String> likeCatBreed(CatBreed catBreed) async {
    var user = await FirebaseAuth.instance.currentUser!;
    var uid = user.uid;
    var x = FirebaseFirestore.instance
        .collection('liked')
        .doc(uid)
        .collection('breeds')
        .doc(catBreed.id);

    await x.set(catBreed.toJson());
    return 'Liked';
  }

  static Future<String> unlikeCatBreed(CatBreed catBreed) async {
    var user = await FirebaseAuth.instance.currentUser!;
    var uid = user.uid;
    var x = FirebaseFirestore.instance
        .collection('liked')
        .doc(uid)
        .collection('breeds')
        .doc(catBreed.id);

    await x.delete();
    return 'Un Liked';
  }
}
