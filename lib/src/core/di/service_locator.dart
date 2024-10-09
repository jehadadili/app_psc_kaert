import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:market/src/core/network/network_info_impl.dart';
import 'package:market/src/feature/register/data/register_remot_data_source/remot_data_imp.dart';
import 'package:market/src/feature/register/data/repository_impl/repository_impl.dart';
import 'package:market/src/feature/register/domain/use_case/use_case_register.dart';
import 'package:market/src/feature/register/presntation/cubit/cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> initServiseLocator() async {
  sl.registerLazySingleton(
    () => RegisterCubit(addUserUseCase: sl.get<AddUserUseCase>()),
  );

  sl.registerLazySingleton(
    () => AddUserUseCase(repositoryRegister: sl.get<RepositoryImpl>()),
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
}
