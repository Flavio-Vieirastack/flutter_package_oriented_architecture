import 'package:dartz/dartz.dart';

import '../../entities/list_posts_entity.dart';
import '../../exceptions/list_fetch_exceptions.dart';

abstract class ListOfPostsUseCase {
  Future<Either<ListFetchExceptions, List<ListPostsEntity>>> call();
}
