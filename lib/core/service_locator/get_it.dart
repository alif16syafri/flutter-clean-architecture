import 'package:flutter_clean_architecture/data/data_sources/article/article_remote_data_source.dart';
import 'package:flutter_clean_architecture/data/repositories/article/article_repository_impl.dart';
import 'package:flutter_clean_architecture/data/utils/dio/dio_builder.dart';
import 'package:flutter_clean_architecture/presentation/features/article/articles/bloc/articles_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> registerPresentationLayer() async {
  /// BLOC
  getIt.registerFactory(() => ArticlesBloc(getIt()));
}

Future<void> registerDataLayer() async {
  /// REPOSITORIES
  getIt.registerLazySingleton<ArticleRepositoryImpl>(() => ArticleRepositoryImpl(getIt()));

  // DATA SOURCES
  getIt.registerLazySingleton<ArticleRemoteDataSource>(() => ArticleRemoteDataSource(getIt()));

  // CORE
  getIt.registerLazySingleton<DioBuilder>(() => DioBuilder());
}
