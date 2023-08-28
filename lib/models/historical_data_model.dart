class HistoricalData {
  DateTime date;
  num open;
  num high;
  num low;
  num close;
  num volume;

  HistoricalData({
    required this.date,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
  });

  factory HistoricalData.fromJSON(Map<String, dynamic> json) {
    return HistoricalData(
      date: DateTime.parse(json['date']),
      open: json['open'],
      high: json['high'],
      low: json['low'],
      close: json['close'],
      volume: json['volume'],
    );
  }
}
