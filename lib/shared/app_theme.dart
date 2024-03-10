import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teklifimgelsin_case/injection/injection_container.dart';
import 'package:teklifimgelsin_case/shared/theme/color_scheme.dart';
import 'package:stacked_themes/stacked_themes.dart';

part 'theme/app_theme.dart';

@immutable
final class AppTheme implements _AppDarkTheme, _AppLightTheme {
  factory AppTheme() => instance;

  const AppTheme._internal();
  static const AppTheme instance = AppTheme._internal();

  @override
  ColorScheme get colorScheme => themeData.colorScheme;

  @override
  TextTheme get textTheme => themeData.textTheme;

  @override
  ThemeData get themeData => locator<ThemeService>().isDarkMode ? darkTheme : lightTheme;

  ThemeData get darkTheme => _AppDarkTheme().themeData;
  ThemeData get lightTheme => _AppLightTheme().themeData;
}
