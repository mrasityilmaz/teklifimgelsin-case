import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_coding_setup/data/models/search_params_model/search_params_model.dart';

@immutable
final class SearchParamsHiveAdapter extends TypeAdapter<SearchParamsModel> {
  @override
  SearchParamsModel read(BinaryReader reader) {
    final asd = reader.read();
    final jsonConverted = jsonEncode(asd);
    return SearchParamsModel.fromJson(json.decode(jsonConverted) as Map<String, dynamic>);
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, SearchParamsModel obj) {
    writer.write(obj.toJson());
  }
}
