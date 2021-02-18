import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/data/models/article/article.dart';
import 'package:flutter_clean_architecture/data/utils/dio/dio_builder.dart';
import 'package:flutter_clean_architecture/domain/repositories/article/article_repository.dart';

const String ARTICLE_PATH = '/everything';

class ArticleRemoteDataSource implements ArticleRepository {
  DioBuilder _dio;

  ArticleRemoteDataSource(this._dio);

  Future<List<ArticleModel>> fetchArticles() async {
    try {
      final Response resp = await _dio.get(
        path: '$ARTICLE_PATH',
        queryParams: {
          'q': 'tesla',
          'sortBy': 'publishedAt'
        }
      );

      List<ArticleModel> data = [];
      List articles = jsonDecode(jsonEncode(resp.data))['articles'];
      
      articles.forEach((item) {
        data.add(ArticleModel.fromJson(item));
      });

      return data;
    } on DioError catch (err) {
      throw Exception(err);
    }
  }
}
