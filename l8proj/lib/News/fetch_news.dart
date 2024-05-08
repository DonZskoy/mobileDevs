import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:l8proj/News/class_news.dart';


Future<List<News>> fetchNews(http.Client client) async{
  final response = await client.get(Uri.parse('https://kubsau.ru/api/getNews.php?key=6df2f5d38d4e16b5a923a6d4873e2ee295d0ac90'));
  if (kDebugMode) {
    print(response.statusCode);
    print(response.body);
  }
  return compute(parseNews, response.body);
}
List<News> parseNews(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<News>((json) => News.fromJSON(json)).toList();
}
