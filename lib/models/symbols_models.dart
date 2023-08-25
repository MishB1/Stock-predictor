class Company {
  String name;
  String symbol;

  Company({required this.name, required this.symbol});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json["Company Name"] as String,
      symbol: json["Symbol"] as String,
    );
  }
}
