import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:json_logic_package/core/adapter/inject.dart';
import 'package:json_logic_package/domain/usecases/listOfPosts/list_of_posts_use_case.dart';
import 'package:json_main/ui/home_page.dart';

import 'cubit/listofposts_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Inject.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProvider(
              create: (context) => ListofpostsCubit(
                  useCase: GetIt.instance.get<ListOfPostsUseCase>())..loadingPosts(),
              child: const HomePage(),
            )
      },
    );
  }
}