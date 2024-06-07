// lib/models/article_model.dart
class Article {
  final String title;
  final String content;
  final String imageUrl;

  Article({
    required this.title,
    required this.content,
    required this.imageUrl,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['label'],
      content: json['healthLabels'].join(', '),
      imageUrl: json['image'],
    );
  }
}
