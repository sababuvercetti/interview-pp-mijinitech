import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_app/UI/home/cat_breeds_page.dart';
import 'package:interview_app/UI/home/liked_page.dart';
import 'package:interview_app/providers/global_providers.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final UserCredential userCredential;
  HomePage({Key? key, required this.userCredential}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> homes = [
      CatBreedsPage(),
      LikedPage(userCredential: widget.userCredential)
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome ${widget.userCredential.user!.email!}',
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: homes[context.watch<HomeBottomIndexProvider>().state],
      bottomNavigationBar: CupertinoTabBar(
          activeColor: Colors.blue,
          currentIndex: context.watch<HomeBottomIndexProvider>().state,
          onTap: (val) {
            context.read<HomeBottomIndexProvider>().save(val);
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.heart_broken,
              ),
              label: 'Liked',
            ),
          ]),
    );
  }
}
