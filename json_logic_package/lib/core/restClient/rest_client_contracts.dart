import 'package:dio/dio.dart';
import 'package:json_logic/core/restClient/rest_client_response.dart';

 class RestClientOptions {
  late Dio dio;
  final baseOptions = BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    connectTimeout: 6000,
    receiveTimeout: 6000,
  );
}

abstract class DioRestClient extends RestClientOptions {
  DioRestClient auth();
  DioRestClient unauth();
  Future<RestClientResponse<T>> post<T>({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
  Future<RestClientResponse<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
  Future<RestClientResponse<T>> put<T>({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
  Future<RestClientResponse<T>> delete<T>({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
  Future<RestClientResponse<T>> patch<T>({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
  Future<RestClientResponse<T>> request<T>({
    required String path,
    required dynamic data,
    required String method,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
}

abstract class RestClientPost {
  Future<RestClientResponse<T>> post<T>({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
}

abstract class RestClientGet {
  Future<RestClientResponse<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
}

abstract class RestClientPut {
  Future<RestClientResponse<T>> put<T>({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
}

abstract class RestClientDelete {
  Future<RestClientResponse<T>> delete<T>({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
}

abstract class RestClientPatch {
  Future<RestClientResponse<T>> patch<T>({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
}

abstract class RestClientRequest {
  Future<RestClientResponse<T>> request<T>({
    required String path,
    required dynamic data,
    required String method,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
}
