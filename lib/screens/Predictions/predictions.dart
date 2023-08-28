import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stock_predictor/components/loginButton.dart';
import 'package:stock_predictor/components/toastNotifications.dart';

import 'package:stock_predictor/models/symbols_models.dart';
import 'package:stock_predictor/globals/globals.dart' as globals;
import 'package:stock_predictor/predictions/predictionsMethods.dart';

class Predictions extends StatefulWidget {
  const Predictions({super.key});

  @override
  State<Predictions> createState() => _PredictionsState();
}

class _PredictionsState extends State<Predictions> {
  String range = 'days';
  String symbol = '';
  List<num> predictions = [];
  TextEditingController number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            predictions.isNotEmpty
                ? Expanded(
                    child: SingleChildScrollView(
                    child: Table(
                      children: predictions
                          .map((prediction) => TableRow(children: [
                                Text(
                                  'Day ${predictions.indexOf(prediction) + 1}',
                                ),
                                Text('$prediction'),
                              ]))
                          .toList(),
                    ),
                  ))
                : Text('Prediction could not be made'),
            SizedBox(
              height: 30,
            ),
            MyButton(
              text: 'Predict',
              onTap: () async {
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

                final difference = DateTime.now().difference(startDate);
                print(difference.inDays);

                if (response.isNotEmpty && response.length != difference.inDays)
                  buildToastNotification(
                    remainingDays: difference.inDays - response.length,
                  );
                setState(() {
                  predictions = response;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
