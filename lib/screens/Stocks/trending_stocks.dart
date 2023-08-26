import "package:flutter/material.dart";
import "package:stock_predictor/models/stock_model.dart";
import 'package:stock_predictor/globals/globals.dart' as globals;
import "package:stock_predictor/stocks/stocks.dart";

class TrendingStocks extends StatefulWidget {
  const TrendingStocks({super.key});

  @override
  State<TrendingStocks> createState() => _TrendingStocksState();
}

class _TrendingStocksState extends State<TrendingStocks> {
  List<Stocks>? stocks;

  setStocks() async {
    final trendingStocks = await getTrendingStocks();
    setState(() {
      stocks = trendingStocks;
    });
  }

  String getCompanyName(String symbol) {
    return globals.companySymbols[symbol] ?? symbol;
  }

  @override
  void initState() {
    setStocks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Trending Stocks'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
          itemCount: stocks?[0].quotes.length,
          itemBuilder: (context, index) {
            return ListTile(
              title:
                  Text(getCompanyName(stocks?[0].quotes[index].symbol ?? '')),
              subtitle: Text(stocks?[0].quotes[index].symbol ?? ''),
            );
          }),
    );
  }
}
