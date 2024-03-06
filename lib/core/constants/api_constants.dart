import 'package:flutter/foundation.dart';

@immutable
final class APIConstants {
  const APIConstants._();

  static const String _baseUrl = 'https://api2.teklifimgelsin.com/api/';

  static String get baseURL => _baseUrl;

  static String get getLoanOffersByTypeEndPoint => 'getLoanOffers';
}
