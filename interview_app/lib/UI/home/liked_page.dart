import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interview_app/models/cat_breed.dart';
import 'package:interview_app/utils/like_util.dart';

class LikedPage extends StatelessWidget {
  final UserCredential userCredential;
  const LikedPage({Key? key, required this.userCredential}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Fluttertoast.showToast(
        msg: "Double tap to unlike",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('liked')
          .doc(userCredential.user!.uid)
          .collection('breeds')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            CatBreed catBreed = CatBreed.fromJson(data);
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onDoubleTap: () async {
                    await LikeUtil.unlikeCatBreed(catBreed).then((value) =>
                        Fluttertoast.showToast(
                            msg: "Unliked",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0));
                  },
                  child: GridTile(
                    child: catBreed.image != null
                        ? Image.network(catBreed.image!['url'] ?? '')
                        : Text(''),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
