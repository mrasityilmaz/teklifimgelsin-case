import 'package:my_coding_setup/core/extensions/dartz_extension.dart';
import 'package:my_coding_setup/data/models/example_model.dart';

abstract class IExampleRemoteRepository {
  Future<DataModel<ExampleModel>> getSomeData();
  Future<DataModel<List<ExampleModel>>> getSomeListData();
}
