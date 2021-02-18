import 'package:flutter_clean_architecture/data/models/article/article.dart';

abstract class ArticleRepository {
  Future<List<ArticleModel>> fetchArticles();
}
