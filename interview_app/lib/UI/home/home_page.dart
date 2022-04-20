import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final UserCredential userCredential;
  const HomePage({Key? key, required this.userCredential}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Home',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const FlutterLogo(size: 200),
          Text(
            'Welcome ${userCredential.user!.email!}',
            style:const TextStyle(
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
