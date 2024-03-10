import 'dart:math';

import 'package:flutter/material.dart';
import 'package:teklifimgelsin_case/shared/theme/color_scheme.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;
}

extension ThemeExtensionn on BuildContext {
  ThemeData get theme => Theme.of(this).copyWith(extensions: Theme.of(this).extensions.values);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colors => Theme.of(this).colorScheme;
  AppColorScheme get appColors => AppColorScheme.instance;
}

extension Themmeee on ThemeData {
  Iterable<ThemeExtension<dynamic>> get extensions => <ThemeExtension<dynamic>>[];
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingNormalVertical => EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingMediumVertical => EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingHighVertical => EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingLowHorizontal => EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingNormalHorizontal => EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingMediumHorizontal => EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingHighHorizontal => EdgeInsets.symmetric(horizontal: highValue);

  EdgeInsets get screenPaddingTop => const EdgeInsets.only(top: 12);
  EdgeInsets get screenPaddingBottom => const EdgeInsets.only(bottom: 12);
  EdgeInsets get adaptiveScreenPaddingBottom => mediaQuery.viewPadding.bottom > 0 ? (screenPaddingBottom * .5) + paddingLowBottom : screenPaddingBottom + paddingLowBottom;
  EdgeInsets get screenPadding => screenPaddingHorizontal + screenPaddingVertical;
  EdgeInsets get screenPaddingHorizontal => screenPaddingLeft + screenPaddingRight;
  EdgeInsets get screenPaddingRight => const EdgeInsets.only(right: 16);
  EdgeInsets get screenPaddingLeft => const EdgeInsets.only(left: 16);

  EdgeInsets get screenPaddingVertical => const EdgeInsets.symmetric(vertical: 12);
}

extension PaddingExtensionSides on BuildContext {
  EdgeInsets get paddingLowLeft => EdgeInsets.only(left: lowValue);
  EdgeInsets get paddingLowRight => EdgeInsets.only(right: lowValue);
  EdgeInsets get paddingLowTop => EdgeInsets.only(top: lowValue);
  EdgeInsets get paddingLowBottom => EdgeInsets.only(bottom: lowValue);

  EdgeInsets get paddingNormalLeft => EdgeInsets.only(left: normalValue);
  EdgeInsets get paddingNormalRight => EdgeInsets.only(right: normalValue);
  EdgeInsets get paddingNormalTop => EdgeInsets.only(top: normalValue);
  EdgeInsets get paddingNormalBottom => EdgeInsets.only(bottom: normalValue);

  EdgeInsets get paddingMediumLeft => EdgeInsets.only(left: mediumValue);
  EdgeInsets get paddingMediumRight => EdgeInsets.only(right: mediumValue);
  EdgeInsets get paddingMediumTop => EdgeInsets.only(top: mediumValue);
  EdgeInsets get paddingMediumBottom => EdgeInsets.only(bottom: mediumValue);

  EdgeInsets get paddingHighLeft => EdgeInsets.only(left: highValue);
  EdgeInsets get paddingHighRight => EdgeInsets.only(right: highValue);
  EdgeInsets get paddingHighTop => EdgeInsets.only(top: highValue);
  EdgeInsets get paddingHighBottom => EdgeInsets.only(bottom: highValue);
}

extension PageExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension DurationExtension on BuildContext {
  Duration get duration150 => const Duration(milliseconds: 150);
  Duration get duration200 => const Duration(milliseconds: 200);
  Duration get duration250 => const Duration(milliseconds: 250);
  Duration get duration300 => const Duration(milliseconds: 300);
  Duration get lowDuration => const Duration(milliseconds: 500);
  Duration get normalDuration => const Duration(seconds: 1);
}

extension RadiusExtension on BuildContext {
  BorderRadiusGeometry get radius4 => BorderRadius.circular(4);
  BorderRadiusGeometry get radius8 => BorderRadius.circular(8);
  BorderRadiusGeometry get radius12 => BorderRadius.circular(12);
  BorderRadiusGeometry get radius16 => BorderRadius.circular(16);
  BorderRadiusGeometry get radius20 => BorderRadius.circular(20);
}
