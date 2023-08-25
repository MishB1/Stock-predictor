import 'dart:convert';

import 'package:http/http.dart';
import 'package:stock_predictor/models/symbols_models.dart';

Future<List<Company>> getCompanySymbols() async {
  final response = await get(Uri.parse(
      "https://pkgstore.datahub.io/core/nasdaq-listings/nasdaq-listed-symbols_json/data/5c10087ff8d283899b99f1c126361fa7/nasdaq-listed-symbols_json.json"));
  final body = jsonDecode(response.body);
  return body.map<Company>((json) => Company.fromJson(json)).toList();
}
