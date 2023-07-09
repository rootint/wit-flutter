import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_app/presentation/bloc/chat/chat_bloc.dart';
import 'package:learning_app/presentation/bloc/courses/courses_bloc.dart';
import 'package:learning_app/presentation/bloc/topics/topics_bloc.dart';

import 'config/constants.dart';
import 'data/network/api/main_api.dart';
import 'domain/repositories/main_repo.dart';
import 'domain/repositories/main_repo_impl.dart';

final sl = GetIt.I;

Future<void> init() async {
  sl.registerFactory(() => CoursesBloc(repo: sl()));
  sl.registerFactory(() => TopicsBloc(sl()));
  sl.registerFactory(() => ChatBloc(sl()));

  sl.registerLazySingleton<MainRepo>(() => MainRepoImpl(sl()));

  sl.registerLazySingleton(() => MainApi(sl()));

  final _dio = Dio(
    BaseOptions(
      baseUrl: C.apiURL,
      headers: {"username": "testing1"},
      contentType: 'application/json',
    ),
  );

  // _dio.interceptors.add(sl.get<TokenInterceptor>());
  sl.registerLazySingleton(() => _dio);
}
