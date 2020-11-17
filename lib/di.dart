import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:retofit_bloc/bloc/delete/delete_cubit.dart';
import 'package:retofit_bloc/bloc/edit/put_bloc.dart';
import 'package:retofit_bloc/bloc/get/get_bloc.dart';
import 'package:retofit_bloc/bloc/trypost/trypost_bloc.dart';
import 'package:retofit_bloc/data/network/apiservice.dart';
import 'package:retofit_bloc/data/repository/contact_repository.dart';

GetIt inject = GetIt.instance;

void locator() {
  Dio dio = Dio();
  inject.registerLazySingleton(() => dio);

  // ApiService apiService = ApiService(inject.call());
  inject.registerLazySingleton<ApiService>(() => ApiService(inject()));

  inject.registerLazySingleton<ContactRepository>(
    () => ContactRepository(
      inject(),
    ),
  );
  inject.registerLazySingleton(
    () => GetBloc(
      inject(),
    ),
  );

  inject.registerLazySingleton(
    () => TrypostBloc(
      inject(),
    ),
  );

  inject.registerLazySingleton(
    () => PutBloc(
      inject(),
    ),
  );

  // inject.registerLazySingleton(
  //   () => PutCubit(
  //     inject(),
  //   ),
  // );

  inject.registerLazySingleton(
    () => DeleteCubit(
      inject(),
    ),
  );
}
