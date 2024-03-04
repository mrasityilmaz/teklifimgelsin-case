import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@immutable
@LazySingleton()
final class MockReaderService {
  Future<T> callMock<T>(String mockUrl, {required T Function(Map<String, dynamic> json) parseModel}) async {
    final data = await rootBundle.loadString(mockUrl);
    final json = jsonDecode(data) as Map<String, dynamic>;
    final mockData = parseModel(json);
    return mockData;
  }

  Future<List<T>> callMockList<T>(String mockUrl, {required T Function(Map<String, dynamic> json) parseModel}) async {
    final data = await rootBundle.loadString(mockUrl);
    final json = jsonDecode(data) as List<dynamic>;
    final mockDatas = json.map<T>((e) => parseModel(e as Map<String, dynamic>)).toList();
    return mockDatas;
  }
}
