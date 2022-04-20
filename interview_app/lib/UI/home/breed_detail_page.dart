import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_app/models/cat_breed.dart';

class BreedDetailPage extends ConsumerWidget {
  final CatBreed catBreed;

  BreedDetailPage({required this.catBreed});
  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${catBreed.name}',
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GridTile(
              child: catBreed.image != null
                  ? Image.network(catBreed.image!['url'] ?? '')
                  : Text(''),
            ),
            Text(catBreed.description!),
          ],
        ),
      ),
    );
  }
}
