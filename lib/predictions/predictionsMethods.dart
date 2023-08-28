import 'dart:convert';

import 'package:http/http.dart';
import 'package:stock_predictor/models/historical_data_model.dart';
import 'package:stock_predictor/secrets/secrets.dart' as secrets;

Future<List<HistoricalData>> getHistoricalData(
    {String? startDate, required String symbol}) async {
  String url =
      'https://api.stockdata.org/v1/data/eod?symbols=$symbol&api_token=${secrets.predictionsApiKey}';

  if (startDate != null) {
    String endDate =
        '${DateTime.now().year}-${DateTime.now().month >= 10 ? DateTime.now().month : '0${DateTime.now().month}'}-${DateTime.now().day}';
    print(endDate);
    url =
        'https://api.stockdata.org/v1/data/eod?symbols=$symbol&date_from=$startDate&date_to=$endDate&api_token=${secrets.predictionsApiKey}';
  }

  final response = await get(Uri.parse(url));

  if (response.statusCode != 200) return [];

  final body = jsonDecode(response.body);
  return List<HistoricalData>.from(
    body['data'].map(
      (data) => HistoricalData.fromJSON(data),
    ),
  );
}

Future<List<num>> getPredictions(
    {required String symbol, required DateTime startDate}) async {
  final historicalData = await getHistoricalData(
    symbol: symbol,
    startDate:
        '${startDate.year}-${startDate.month >= 10 ? startDate.month : '0${startDate.month}'}-${startDate.day}',
  );

  List<String> dates = historicalData
      .map((data) =>
          '${data.date.year}-${data.date.month >= 10 ? data.date.month : '0${data.date.month}'}-${data.date.day}')
      .toList();
  List<num> close = historicalData.map((data) => data.close).toList();

  final response = await post(
    Uri.parse('http://10.0.2.2:8000/predict'),
    body: jsonEncode({"Date": dates, "Close": close}),
    headers: {'content-type': 'application/json', 'accept': 'application/json'},
  );

  print(response.body);
  if (response.statusCode != 200) return [];

  final body = jsonDecode(response.body);

  return List<num>.from(body['Prediction']);
}
