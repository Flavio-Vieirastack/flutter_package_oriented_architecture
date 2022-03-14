import 'package:dartz/dartz.dart';

import '../../domain/exceptions/list_fetch_exceptions.dart';
import '../DTOs/posts_dto.dart';

abstract class ListOfPostsDataSource {
  Future<Either<ListFetchExceptions, List<PostsDto>>> fetchData();
}
