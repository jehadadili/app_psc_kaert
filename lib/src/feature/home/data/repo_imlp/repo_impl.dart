import 'package:dartz/dartz.dart';
import 'package:market/src/core/errors/failure.dart';
import 'package:market/src/core/network/network_info_impl.dart';
import 'package:market/src/feature/home/data/remot_date/remot_data_imp.dart';
import 'package:market/src/feature/home/domain/model/home_model.dart';
import 'package:market/src/feature/home/domain/repo/repo.dart';

class LabtopRepoImpl implements ReopHome {
  final  LabtopRemotDataImp labtopRemotDataImp;
  final NetworkInfoImpl networkInfoImpl;
  LabtopRepoImpl({
    required this.labtopRemotDataImp,
    required this.networkInfoImpl,
  });
  @override
  Future<Either<Failure, List<HomeModel>>> getLabtop() async {
    try {
      if (await networkInfoImpl.isconected) {
        var respone = await labtopRemotDataImp.getLabtop();
        return respone;
      } else {
        throw Exception("feild product");
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
