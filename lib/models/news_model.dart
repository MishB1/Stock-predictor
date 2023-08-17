class News {
  String title;
  String source;
  String description;

  News({
    required this.title,
    required this.description,
    required this.source,
  });

  factory News.fromJSON(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      description: json['description'],
      source: json['source'],
    );
  }
}
