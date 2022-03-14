import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../domain/entities/list_posts_entity.dart';
import '../../domain/exceptions/list_fetch_exceptions.dart';
import '../../domain/repositories/list_posts_repository.dart';
import '../datasource/list_of_posts_data_source.dart';

class ListOfPostsRepositoryImpl implements ListPostsRepository {
  final ListOfPostsDataSource _listOfPostsDataSource;
  ListOfPostsRepositoryImpl(
      {required ListOfPostsDataSource listOfPostsDataSource})
      : _listOfPostsDataSource = listOfPostsDataSource;
  @override
  Future<Either<ListFetchExceptions, List<ListPostsEntity>>> call() async {
    try {
      final postsData = await _listOfPostsDataSource.fetchData();
      return postsData;
    } catch (e, s) {
      log('Erro no repository', error: e, stackTrace: s);
      return Left(ListFetchExceptions());
    }
  }
}
