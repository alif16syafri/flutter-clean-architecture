import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/data/core/constant.dart';

class DioBuilder {
  // Singleton creation
  static final DioBuilder _instance = DioBuilder._internal();

  Dio _dio = Dio();

  DioBuilder._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: DataConstant.BASE_URL,
    );

    _dio = Dio(options);

    _dio.interceptors.add(InterceptorsWrapper(
      onError: (DioError err) => _handleError(err),
    ));
  }

  factory DioBuilder() => _instance;

  Future<Map<String, String>> _generateHeaders(Map<String, String> headers) async {
    final Map<String, String> baseHeaders = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer token',
    };

    final Map<String, String> finalHeaders = {
      ...baseHeaders,
      ...headers,
    };

    return finalHeaders;
  }

  Future<Map<String, String>> _generateQueryParameters(Map<String, dynamic> parameters) async {
    final Map<String, String> baseParameters = {
      'apiKey': DataConstant.API_KEY,
    };

    final Map<String, String> finalParameters = {
      ...baseParameters,
      ...parameters,
    };

    return finalParameters;
  }

  void _handleError(DioError err) {
    // Request Logger
    print('--> REQUEST: ${err.request.method} ${err.request.path}');
    print('Data: ${err.request.data}');
    print('Query Params: ${err.request.queryParameters}');
    print('Headers: ${err.request.headers}');
    // Response Logger
    print('<-- RESPONSE: ${err.response.statusCode} ${err.response.statusMessage}');
    print('Data: ${err.response.data}');
    // Generic Logger
    print('--> DIO ERR: $err');
    print('Type: ${err.type.toString()}');
    print('<-- END HTTP');
  }

  /// GET handler
  Future<Response> get({
    String path,
    Map<String, String> headers = const {},
    Map<String, String> queryParams = const {},
  }) async {
    return _dio.get(
      path,
      queryParameters: await _generateQueryParameters(queryParams),
      options: Options(
        headers: await _generateHeaders(headers),
      ),
    );
  }

  /// POST handler
  Future<Response> post({
    String path,
    String body,
    Map<String, String> headers = const {},
    Map<String, dynamic> queryParams = const {},
  }) async {
    return _dio.post(
      path,
      data: body,
      queryParameters: await _generateQueryParameters(queryParams),
      options: Options(
        headers: await _generateHeaders(headers),
      ),
    );
  }

  /// PUT handler
  Future<Response> put({
    String path,
    String body,
    Map<String, String> headers = const {},
    Map<String, dynamic> queryParams = const {},
  }) async {
    return _dio.put(
      path,
      data: body,
      queryParameters: await _generateQueryParameters(queryParams),
      options: Options(
        headers: await _generateHeaders(headers),
      ),
    );
  }

  /// DELETE handler
  Future<Response> delete({
    String path,
    String body,
    Map<String, String> headers = const {},
    Map<String, dynamic> queryParams = const {},
  }) async {
    return _dio.delete(
      path,
      data: body,
      queryParameters: await _generateQueryParameters(queryParams),
      options: Options(
        headers: await _generateHeaders(headers),
      ),
    );
  }

  /// PATCH handler
  Future<Response> patch({
    String path,
    String body,
    Map<String, String> headers = const {},
    Map<String, dynamic> queryParams = const {},
  }) async {
    return _dio.patch(
      path,
      data: body,
      queryParameters: await _generateQueryParameters(queryParams),
      options: Options(
        headers: await _generateHeaders(headers),
      ),
    );
  }
}
