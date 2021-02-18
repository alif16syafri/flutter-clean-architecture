part of 'articles_bloc.dart';

abstract class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object> get props => [];
}

class Loading extends ArticlesState {}

class Loaded extends ArticlesState {
  final List<Article> articles;

  Loaded({
    this.articles,
  });

  @override
  List<Object> get props => [articles];
}

class Error extends ArticlesState {}
