import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:market/src/core/network/network_info_impl.dart';
import 'package:market/src/feature/home/data/remot_date/remot_data_imp.dart';
import 'package:market/src/feature/home/data/repo_imlp/repo_impl.dart';
import 'package:market/src/feature/home/domain/use_case/use_case.dart';
import 'package:market/src/feature/home/presntation/cubit/cubit.dart';
import 'package:market/src/feature/auth/data/auth_remot_data_source/remot_data_imp.dart';
import 'package:market/src/feature/auth/data/repository_impl/repository_impl.dart';
import 'package:market/src/feature/auth/domain/use_case/use_case_login.dart';
import 'package:market/src/feature/auth/domain/use_case/use_case_register.dart';
import 'package:market/src/feature/auth/presntation/cubit/cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> initServiseLocator() async {
  sl.registerLazySingleton(
    () => AuthCubit(
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
    () => LaptopCubit(
      laptopUseCasehome: sl.get<LaptopUseCase>(),
    ),
  );
  sl.registerLazySingleton(
    () => LaptopUseCase(
      reopHome: sl.get<LaptopRepoImpl>(),
    ),
  );
  sl.registerLazySingleton(
    () => LaptopRepoImpl(
        laptopRemotDataImp: sl.get<LaptopRemotDataImp>(),
        networkInfoImpl: sl.get<NetworkInfoImpl>()),
  );

  sl.registerLazySingleton(
    () => LaptopRemotDataImp(),
  );
}
