import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:market/src/core/network/network_info_impl.dart';
import 'package:market/src/feature/home/data/remot_date/remot_data_imp.dart';
import 'package:market/src/feature/home/data/repo_imlp/repo_impl.dart';
import 'package:market/src/feature/home/domain/repo/repo.dart';
import 'package:market/src/feature/home/domain/use_case/use_case.dart';
import 'package:market/src/feature/home/presntation/cubit/cubit.dart';
import 'package:market/src/feature/register/data/register_remot_data_source/remot_data_imp.dart';
import 'package:market/src/feature/register/data/repository_impl/repository_impl.dart';
import 'package:market/src/feature/register/domain/use_case/use_case_login.dart';
import 'package:market/src/feature/register/domain/use_case/use_case_register.dart';
import 'package:market/src/feature/register/presntation/cubit/cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> initServiseLocator() async {
  sl.registerLazySingleton(
    () => RegisterCubit(
        addUserUseCase: sl.get<AddUserUseCase>(),
        useCaseLogin: sl.get<UseCaseLogin>()),
  );

  sl.registerLazySingleton(
    () => AddUserUseCase(repositoryRegister: sl.get<RepositoryImpl>()),
  );
  sl.registerLazySingleton(
    () => UseCaseLogin(repositoryRegister: sl.get<RepositoryImpl>()),
  );
  sl.registerLazySingleton(
    () => RepositoryImpl(
        remotDataImp: sl.get<RemotDataImp>(),
        networkInfoImpl: sl.get<NetworkInfoImpl>()),
  );
  sl.registerLazySingleton(
    () => RemotDataImp(),
  );

  sl.registerLazySingleton(
    () => NetworkInfoImpl(internetConnection: sl.get<InternetConnection>()),
  );

  sl.registerLazySingleton(
    () => InternetConnection(),
  );

  sl.registerLazySingleton(
    () => LabtopCubit(
      labtopUseCasehome: sl.get<LabtopUseCase>(),
    ),
  );
  sl.registerLazySingleton(
    () => LabtopUseCase(
      reopHome: sl.get<LabtopRepoImpl>(),
    ),
  );
  sl.registerLazySingleton(
    () => LabtopRepoImpl(
        labtopRemotDataImp: sl.get<LabtopRemotDataImp>(),
        networkInfoImpl: sl.get<NetworkInfoImpl>()),
  );

  sl.registerLazySingleton(
    () => LabtopRemotDataImp(),
  );
}
