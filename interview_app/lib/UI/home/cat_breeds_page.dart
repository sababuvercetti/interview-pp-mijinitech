import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interview_app/models/cat_breed.dart';
import 'package:interview_app/providers/cat_breeds_provider.dart';
import 'package:interview_app/routes/router.gr.dart';
import 'package:interview_app/utils/like_util.dart';

class CatBreedsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<CatBreed>> breeds = ref.watch(catBreedsProvider);
    Fluttertoast.showToast(
        msg: "Double tap to like",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    return breeds.maybeWhen(orElse: () {
      return Container();
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }, data: (val) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: val.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    AutoRouter.of(context)
                        .push(BreedDetailRoute(catBreed: val[index]));
                  },
                  onDoubleTap: () async {
                    var x = await LikeUtil.likeCatBreed(val[index]);
                    Fluttertoast.showToast(
                        msg: "Liked",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                  child: GridTile(
                    child: val[index].image != null
                        ? Image.network(val[index].image!['url'] ?? '')
                        : Text(''),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
