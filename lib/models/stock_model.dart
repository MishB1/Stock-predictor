class Stocks {
  List<Quotes> quotes;
  Stocks({required this.quotes});

  factory Stocks.fromJSON(Map<String, dynamic> json) {
    return Stocks(
      quotes: List<Quotes>.from(
        json['quotes'].map(
          (quote) => Quotes.fromJSON(quote),
        ),
      ),
    );
  }
}

class Quotes {
  String symbol;

  Quotes({required this.symbol});

  factory Quotes.fromJSON(Map<String, dynamic> json) {
    return Quotes(symbol: json['symbol']);
  }
}
