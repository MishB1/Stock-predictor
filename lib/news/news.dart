import 'dart:convert';

import 'package:http/http.dart';
import 'package:stock_predictor/models/news_model.dart';

import 'package:stock_predictor/secrets/secrets.dart' as secrets;

Future<List<News>> getTopNews() async {
  final response = await get(Uri.parse(
      'https://api.marketaux.com/v1/news/all?api_token=${secrets.newsApiKey}'));

  if (response.statusCode != 200) return [];

  final newsData = Map<String, dynamic>.from(jsonDecode(response.body));

  return List<News>.from(newsData['data'].map((news) => News.fromJSON(news)))
      .take(3)
      .toList();
}
