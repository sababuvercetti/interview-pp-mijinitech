import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_app/models/cat_breed.dart';

final catBreedsProvider = FutureProvider<List<CatBreed>>(((ref) async {
  return await Dio()
      .get('https://api.thecatapi.com/v1/breeds',
          options: Options(
              headers: {'x-api-key': '1388090b-bec1-4ab1-b868-f8f651d2abfb'}))
      .then((response) {
    List jsonData = response.data;
    return List.generate(
        jsonData.length, (index) => CatBreed.fromJson(jsonData[index]));
  });
}));

final catBreedsDetailsProvider = FutureProvider<List<CatBreed>>(((ref) async {
  
  return await Dio()
      .get('https://api.thecatapi.com/v1/breeds',
          options: Options(
              headers: {'x-api-key': '1388090b-bec1-4ab1-b868-f8f651d2abfb'}))
      .then((response) {
    List jsonData = response.data;
    return List.generate(
        jsonData.length, (index) => CatBreed.fromJson(jsonData[index]));
  });
}));
