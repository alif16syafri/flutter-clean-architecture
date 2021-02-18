import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/data/repositories/article/article_repository_impl.dart';
import 'package:flutter_clean_architecture/domain/entities/article/article.dart';

part 'articles_event.dart';

part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticleRepositoryImpl _repository;

  ArticlesBloc(this._repository) : super(Loading());

  @override
  Stream<ArticlesState> mapEventToState(
    ArticlesEvent event,
  ) async* {
    if (event is FetchArticlesEvent) {
      try {
        final List<Article> articles = await _repository.fetchArticles();
        yield Loaded(articles: articles);
      } catch (err) {
        yield Error();
      }
    }
  }
}
