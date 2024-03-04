import 'package:flutter/material.dart';

final class AppTheme {
  factory AppTheme() => _instance ??= AppTheme._();

  AppTheme._();
  static AppTheme? _instance;

  final ThemeData _themeData = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  ThemeData get themeData => _themeData;
}
