import 'package:flutter_clean_architecture/data/data_sources/article/article_remote_data_source.dart';
import 'package:flutter_clean_architecture/data/models/article/article.dart';
import 'package:flutter_clean_architecture/domain/repositories/article/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  ArticleRemoteDataSource _remoteDataSource;

  ArticleRepositoryImpl(
    this._remoteDataSource,
  );

  Future<List<ArticleModel>> fetchArticles() {
    return _remoteDataSource.fetchArticles();
  }
}
