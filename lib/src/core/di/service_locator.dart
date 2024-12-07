import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:market/src/core/network/network_info_impl.dart';
import 'package:market/src/feature/cart/data/remot_data/remot_data_impl.dart';
import 'package:market/src/feature/cart/data/repo_imple/repo_imple.dart';
import 'package:market/src/feature/cart/domain/use_cases/add_cart.dart';
import 'package:market/src/feature/cart/domain/use_cases/delete_cart.dart';
import 'package:market/src/feature/cart/domain/use_cases/product_cart.dart';
import 'package:market/src/feature/cart/domain/use_cases/ubdate_cart.dart';
import 'package:market/src/feature/cart/presntation/cubit/cubit.dart';
import 'package:market/src/feature/home/data/remot_date/remot_data_imp.dart';
import 'package:market/src/feature/home/data/repo_imlp/repo_impl.dart';
import 'package:market/src/feature/home/domain/use_case/use_case.dart';
import 'package:market/src/feature/home/presntation/cubit/cubit.dart';
import 'package:market/src/feature/auth/data/auth_remot_data_source/remot_data_imp.dart';
import 'package:market/src/feature/auth/data/repository_impl/repository_impl.dart';
import 'package:market/src/feature/auth/domain/use_case/use_case_login.dart';
import 'package:market/src/feature/auth/domain/use_case/use_case_register.dart';
import 'package:market/src/feature/auth/presntation/cubit/cubit.dart';
import 'package:market/src/feature/user_profile/data/reomt_data/reomt_data_imp.dart';
import 'package:market/src/feature/user_profile/data/repo_imp/repo_imp.dart';
import 'package:market/src/feature/user_profile/domain/use_cass/use_cass.dart';
import 'package:market/src/feature/user_profile/domain/use_cass/use_cass_ubdate_profile.dart';
import 'package:market/src/feature/user_profile/presntation/cubit/cubit.dart';

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
  sl.registerLazySingleton(
    () => CartCubit(
        addCartUsecass: sl.get<AddCartUsecass>(),
        getCartusecass: sl.get<GetCartusecass>(),
        getDeleteCart: sl.get<GetDeleteCart>(),
        putUbdateCart: sl.get<PutUbdateCart>()),
  );
  sl.registerLazySingleton(
    () => GetCartusecass(
      repoCart: sl.get<RepoCartImple>(),
    ),
  );
  sl.registerLazySingleton(
    () => PutUbdateCart(
      repoCart: sl.get<RepoCartImple>(),
    ),
  );
  sl.registerLazySingleton(
    () => GetDeleteCart(
      repoCart: sl.get<RepoCartImple>(),
    ),
  );
  sl.registerLazySingleton(
    () => AddCartUsecass(repoCart: sl.get<RepoCartImple>()),
  );
  sl.registerLazySingleton(
    () => RepoCartImple(
        networkInfoImpl: sl.get<NetworkInfoImpl>(),
        remotDataImplCart: sl.get<RemotDataImplCart>()),
  );
  sl.registerLazySingleton(
    () => RemotDataImplCart(),
  );
  sl.registerLazySingleton(
    () => ProfileCubit(
        useCassprofile: sl.get<UseCassprofile>(),
        useCassUbdateProfile: sl.get<UseCassUbdateProfile>()),
  );
  sl.registerLazySingleton(
    () => UseCassprofile(repoProfile: sl.get<RepoProfileImp>()),
  );
  sl.registerLazySingleton(
    () => UseCassUbdateProfile(repoProfile: sl.get<RepoProfileImp>()),
  );
  sl.registerLazySingleton(
    () => ReomtDataprofileImp(),
  );

  sl.registerLazySingleton(
    () => RepoProfileImp(
      reomtDataprofileImp: sl.get<ReomtDataprofileImp>(),
      networkInfoImpl: sl.get<NetworkInfoImpl>(),
    ),
  );
}
