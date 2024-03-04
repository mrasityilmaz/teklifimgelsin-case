import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_coding_setup/core/errors/errors.dart';
import 'package:my_coding_setup/core/extensions/dartz_extension.dart';
import 'package:my_coding_setup/core/platform/network_info.dart';
import 'package:my_coding_setup/data/models/example_model.dart';
import 'package:my_coding_setup/domain/repositories/example_repository/data_sources/ilocal_repository.dart';
import 'package:my_coding_setup/domain/repositories/example_repository/data_sources/iremote_repository.dart';
import 'package:my_coding_setup/domain/repositories/example_repository/i_example_repository.dart';

@LazySingleton(as: IExampleRepository)
class ExampleRepository implements IExampleRepository {
  const ExampleRepository({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  final IExampleRemoteRepository remoteDataSource;
  final IExampleLocalRepository localDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<DataModel<ExampleModel>> getSomeData() async {
    if (await networkInfo.isConnected) {
      return await remoteDataSource.getSomeData();
    } else {
      ///
      /// I dont have local data source so I will return other options
      ///
      return Left(NetworkFailure());
    }
  }

  @override
  Future<DataModel<List<ExampleModel>>> getSomeListData() async {
    if (await networkInfo.isConnected) {
      return await remoteDataSource.getSomeListData();
    } else {
      ///
      /// I dont have local data source so I will return other options
      ///
      return Left(NetworkFailure());
    }
  }
}
