import 'package:flutter_clean_architecture/domain/entities/article/article.dart';

class ArticleModel extends Article {
  ArticleModel({
    String author,
    String title,
    String description,
    String url,
    String urlToImage,
    String content,
  }) : super(
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          content: content,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        author: json['author'] as String ?? '',
        title: json['title'] as String ?? '',
        description: json['description'] as String ?? '',
        url: json['url'] as String ?? '',
        urlToImage: json['urlToImage'] as String ?? '',
        content: json['content'] as String ?? '',
      );
}
