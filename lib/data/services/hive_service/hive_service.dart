// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_coding_setup/core/constants/hive_constants.dart';
import 'package:my_coding_setup/core/extensions/list_extension.dart';
import 'package:my_coding_setup/core/services/logger/logger_service.dart';
import 'package:my_coding_setup/data/hive_adapters/search_params_hive_adapter.dart';
import 'package:my_coding_setup/data/models/search_params_model/search_params_model.dart';
import 'package:my_coding_setup/data/services/hive_service/i_hivebox_service.dart';
import 'package:path_provider/path_provider.dart';

part 'boxes/search_params_box_service.dart';

@immutable
final class HiveService {
  factory HiveService() {
    return instance;
  }

  HiveService._internal();
  static final HiveService instance = HiveService._internal();

  ///
  ///
  ///

  final _SearchParamsBoxService searchParamsBoxService = _SearchParamsBoxService(boxKey: HiveConstants.searchParamsBoxKey);

  ///
  ///
  ///
  ///

  Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDir.path);

    // await Hive.deleteBoxFromDisk(HiveConstants.themeConfigurationBoxKey);
    // await Hive.deleteBoxFromDisk(HiveConstants.likedQuotesBoxKey);

    Hive.registerAdapter(SearchParamsHiveAdapter());

    await Future.wait([
      searchParamsBoxService.initBox(),
    ]);
  }
}
