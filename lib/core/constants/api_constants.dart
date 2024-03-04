import 'package:stacked/stacked_annotations.dart';

final class APIConstants {
  APIConstants._();

  @factoryParam
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/';

  static String get baseURL => _baseUrl;
}
