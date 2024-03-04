import 'package:injectable/injectable.dart';
import 'package:my_coding_setup/core/extensions/dartz_extension.dart';
import 'package:my_coding_setup/data/models/example_model.dart';
import 'package:my_coding_setup/domain/repositories/example_repository/data_sources/iremote_repository.dart';

@Environment('real')
@LazySingleton(as: IExampleRemoteRepository)
class ExampleHttpRepository implements IExampleRemoteRepository {
  @override
  Future<DataModel<ExampleModel>> getSomeData() async {
    // TODO: implement getWeather
    throw UnimplementedError();
  }

  @override
  Future<DataModel<List<ExampleModel>>> getSomeListData() {
    // TODO: implement getSomeListData
    throw UnimplementedError();
  }
}
