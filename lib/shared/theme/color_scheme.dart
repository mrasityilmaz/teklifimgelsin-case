import 'package:flutter/material.dart';

@immutable
final class AppColorScheme {
  const AppColorScheme._init();
  static AppColorScheme? _instace;
  static AppColorScheme get instance {
    _instace ??= const AppColorScheme._init();
    return _instace!;
  }

  Color get primaryWhiteBackgroundColor => const Color.fromRGBO(255, 255, 255, 1);
  Color get primaryGreyBackgroundColor => const Color.fromRGBO(135, 135, 135, 0.15);
  Color get primaryGreyBorderColor => const Color(0xFFd3d3d3);

  Color get primaryBlueColor => const Color.fromRGBO(29, 48, 89, 1);
  Color get primaryOrangeColor => const Color.fromRGBO(232, 82, 39, 1);

  Color get primaryBlueAccentColor => const Color.fromRGBO(59, 180, 172, 1);

  Color get primaryBlackTextColor => const Color.fromRGBO(0, 0, 0, .85);
  Color get secondaryBlackTextColor => const Color.fromRGBO(134, 134, 134, 1);
}
