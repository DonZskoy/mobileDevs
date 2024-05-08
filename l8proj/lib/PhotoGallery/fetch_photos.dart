import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:l8proj/PhotoGallery/class_photo.dart';

Future<List<Photo>> fetchPhotos(http.Client client) async{
  final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  return compute(parsePhotos, response.body);
}
List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.fromJSON(json)).toList();
}
