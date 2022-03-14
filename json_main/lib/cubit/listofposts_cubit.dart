import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:json_logic_package/domain/entities/list_posts_entity.dart';
import 'package:json_logic_package/domain/exceptions/list_fetch_exceptions.dart';
import 'package:json_logic_package/domain/usecases/listOfPosts/list_of_posts_use_case.dart';
import 'package:meta/meta.dart';

part 'listofposts_state.dart';

class ListofpostsCubit extends Cubit<ListofpostsState> {
  
  final ListOfPostsUseCase _useCase;

  ListofpostsCubit({required ListOfPostsUseCase useCase})
      : _useCase = useCase,
        super(const ListofpostsState());

  Future<void> loadingPosts() async {
    try {
      emit(ListofpostsState(posts: state.posts, status: PostsStatus.loading));
      final postsData = await _useCase.call();
      await Future.delayed(const Duration(seconds: 5));
      postsData.fold(
        (faliure) => throw ListFetchExceptions(),
        (posts) =>
            emit(ListofpostsState(posts: posts, status: PostsStatus.sucess)),
      );
    } catch (e, s) {
      log('Erro no cubit', error: e, stackTrace: s);
      throw Left(ListFetchExceptions());
    }
  }
}
