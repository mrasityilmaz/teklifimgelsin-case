import 'package:flutter/foundation.dart';
import 'package:stacked/stacked_annotations.dart';

@immutable
final class APIConstants {
  const APIConstants._();

  @factoryParam
  static const String _baseUrl = 'https://api2.teklifimgelsin.com/api/';

  static String get baseURL => _baseUrl;

  static String get getLoanOffersByTypeEndPoint => 'getLoanOffers';
}
