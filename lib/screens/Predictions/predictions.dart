import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stock_predictor/components/loginButton.dart';
import 'package:stock_predictor/components/toastNotifications.dart';
import 'package:stock_predictor/models/predictions_model.dart';

import 'package:stock_predictor/models/symbols_models.dart';
import 'package:stock_predictor/globals/globals.dart' as globals;
import 'package:stock_predictor/predictions/predictionsMethods.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Predictions extends StatefulWidget {
  const Predictions({super.key});

  @override
  State<Predictions> createState() => _PredictionsState();
}

class _PredictionsState extends State<Predictions> {
  String symbol = '';
  String range = 'days';
  bool showChart = false;
  bool isLoading = false;
  List<Prediction> predictions = [];
  TextEditingController number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text('Predictions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Autocomplete<String>(
              onSelected: (option) {
                setState(() {
                  symbol = option;
                });
                print(symbol);
              },
              optionsBuilder: (textEditingValue) {
                final search = textEditingValue.text;
                if (search == '') {
                  return const Iterable<String>.empty();
                }
                final filtered = globals.companies.where((Company option) {
                  return option.name
                          .toLowerCase()
                          .contains(search.toLowerCase()) ||
                      option.symbol
                          .toLowerCase()
                          .contains(search.toLowerCase());
                });
                return filtered.map((company) => company.symbol);
              },
              fieldViewBuilder: (context, textEditingController, focusNode,
                  onFieldSubmitted) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    focusNode: focusNode,
                    controller: textEditingController,
                    textCapitalization: TextCapitalization.characters,
                    onSubmitted: (_) => onFieldSubmitted(),
                    onChanged: (value) {
                      setState(() {
                        symbol = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Stock Symbol(AAPL)',
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 170,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.only(
                left: 4,
                right: 2,
              ),
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: TextField(
                      controller: number,
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(border: InputBorder.none),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: DropdownButtonFormField(
                      alignment: Alignment.centerRight,
                      value: range,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      items: const [
                        DropdownMenuItem(value: 'days', child: Text('days')),
                        DropdownMenuItem(value: 'weeks', child: Text('weeks')),
                        DropdownMenuItem(
                            value: 'months', child: Text('months')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          range = value ?? 'days';
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : predictions.isNotEmpty
                    ? Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Show Graph'),
                                SizedBox(
                                  width: 20,
                                ),
                                Switch(
                                    value: showChart,
                                    onChanged: (value) {
                                      setState(() {
                                        showChart = value;
                                      });
                                    }),
                              ],
                            ),
                            showChart
                                ? Container(
                                    child: SfCartesianChart(
                                      primaryXAxis: CategoryAxis(
                                          interactiveTooltip:
                                              InteractiveTooltip()),
                                      series: <ChartSeries>[
                                        // Renders line chart
                                        FastLineSeries<Prediction, String>(
                                            dataSource: predictions,
                                            xValueMapper:
                                                (Prediction prediction, _) =>
                                                    prediction.day,
                                            yValueMapper:
                                                (Prediction prediction, _) =>
                                                    prediction.prediction)
                                      ],
                                    ),
                                  )
                                : Expanded(
                                    child: SingleChildScrollView(
                                    child: Table(
                                      border: TableBorder.all(),
                                      children: predictions
                                          .map(
                                            (prediction) => TableRow(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(prediction.day),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      '${prediction.prediction}'),
                                                ),
                                              ],
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  )),
                          ],
                        ),
                      )
                    : Text('Prediction could not be made'),
            SizedBox(
              height: 30,
            ),
            MyButton(
              text: 'Predict',
              onTap: () async {
                setState(() {
                  predictions = [];
                  isLoading = true;
                });
                DateTime currentDate = DateTime.now();
                DateTime startDate = range == 'days'
                    ? DateTime(currentDate.year, currentDate.month,
                        currentDate.day - int.parse(number.text))
                    : range == 'weeks'
                        ? DateTime(currentDate.year, currentDate.month,
                            currentDate.day - int.parse(number.text) * 7)
                        : range == 'months'
                            ? DateTime(
                                currentDate.year,
                                currentDate.month - int.parse(number.text),
                                currentDate.day)
                            : DateTime.now();
                final response =
                    await getPredictions(symbol: symbol, startDate: startDate);

                setState(() {
                  isLoading = false;
                });

                final difference = DateTime.now().difference(startDate);

                if (response.isNotEmpty && response.length != difference.inDays)
                  buildToastNotification(
                    remainingDays: difference.inDays - response.length,
                  );
                for (var prediction in response) {
                  setState(() {
                    predictions.add(Prediction(
                        day: 'Day ${response.indexOf(prediction) + 1}',
                        prediction: prediction));
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
