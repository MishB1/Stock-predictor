import 'dart:convert';

import 'package:http/http.dart';
import 'package:stock_predictor/models/stock_model.dart';
import 'package:stock_predictor/secrets/secrets.dart' as secrets;

Future<List<Stocks>> getTrendingStocks() async {
  final response = await get(
      Uri.parse("https://yfapi.net/v1/finance/trending/US"),
      headers: {'x-api-key': secrets.stocksApiKey});
  if (response.statusCode != 200) throw Exception();
  final body = jsonDecode(response.body);
  final results = body['finance']['result'];

  return List<Stocks>.from(results.map((result) => Stocks.fromJSON(result)));
}
