import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;

  Article({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.content,
  });

  @override
  List<Object> get props => [
        author,
        title,
        description,
        url,
        urlToImage,
        content,
      ];
}
