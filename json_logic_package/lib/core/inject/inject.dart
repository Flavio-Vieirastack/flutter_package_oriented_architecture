

import 'package:get_it/get_it.dart';

import '../../data/datasource/list_of_posts_data_source.dart';
import '../../data/datasource/list_of_posts_data_source_impl.dart';
import '../../data/repositories/list_of_posts_repository_impl.dart';
import '../../domain/repositories/list_posts_repository.dart';
import '../../domain/usecases/listOfPosts/list_of_posts_use_case.dart';
import '../../domain/usecases/listOfPosts/list_of_posts_use_case_impl.dart';
import '../restClient/dio_rest_client.dart';
import '../restClient/rest_client_contracts.dart';
import '../restClient/rest_client_methods.dart';

final GetIt getIt = GetIt.instance;

class Inject {
  Inject._();
  static Future<void> init() async {
    
    getIt.registerFactory<RestClientGet>(() => RestClientGetImpl());
    getIt.registerFactory<RestClientPost>(() => RestClientPostImpl());
    getIt.registerFactory<RestClientPut>(() => RestClientPutImpl());
    getIt.registerFactory<RestClientDelete>(() => RestClientDeleteImpl());
    getIt.registerFactory<RestClientPatch>(() => RestClientPatchImpl());
    getIt.registerFactory<RestClientRequest>(() => RestClientResquestImpl());

    getIt.registerFactory<DioRestClient>(() => DioRestClientImpl(
        restClientGet: getIt(),
        restClientPost: getIt(),
        restClientPut: getIt(),
        restClientDelete: getIt(),
        restClientPatch: getIt(),
        restClientRequest: getIt()));

    getIt.registerLazySingleton<ListOfPostsDataSource>(
        () => ListOfPostsDataSourceImpl());

    getIt.registerLazySingleton<ListPostsRepository>(
        () => ListOfPostsRepositoryImpl(listOfPostsDataSource: getIt()));

    getIt.registerLazySingleton<ListOfPostsUseCase>(
        () => ListOfPostsUseCaseImpl(repository: getIt()));
  }
}
