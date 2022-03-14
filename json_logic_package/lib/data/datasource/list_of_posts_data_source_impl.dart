import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import '../../core/restClient/rest_client_contracts.dart';
import '../../domain/exceptions/list_fetch_exceptions.dart';
import '../DTOs/posts_dto.dart';
import 'list_of_posts_data_source.dart';

class ListOfPostsDataSourceImpl implements ListOfPostsDataSource {
  final GetIt getIt = GetIt.instance;
  @override
  Future<Either<ListFetchExceptions, List<PostsDto>>> fetchData() async {
    final dio = getIt.get<DioRestClient>();
    try {
      final response =
          await dio.unauth().get<List>(path: '/posts');
      final data = response.data?.map((e) => PostsDto.fromMap(e)).toList() ??
          <PostsDto>[];
      return Right(data);
    } catch (e, s) {
      log('Erro no httpClient', error: e, stackTrace: s);
      return Left(ListFetchExceptions());
    }
  }
}
