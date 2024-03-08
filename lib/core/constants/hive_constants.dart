import 'package:flutter/foundation.dart';

@immutable
final class HiveConstants {
  const HiveConstants._();

  ///
  /// $Warning: Do not change the version number, it is used to identify the data in the box.
  /// Only change the version number if you are sure that the data in the box will not be used anymore.
  ///

  static const String _version = 'v.1.0.0';

  static const String _searchParamsBoxKey = '**searchParamsBox**$_version**';

  static String get searchParamsBoxKey => _searchParamsBoxKey;
}
