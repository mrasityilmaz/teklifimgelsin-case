import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_coding_setup/core/extensions/context_extension.dart';

final class AppDialogs {
  factory AppDialogs() => instance;

  const AppDialogs._internal();
  static const AppDialogs instance = AppDialogs._internal();

  Future<T?> showModalBottomSheetDialog<T>(
    BuildContext context, {
    required Widget child,
    Color? backgroundColor,
    String? barrierLabel,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    bool? showDragHandle,
    bool useSafeArea = false,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
    Offset? anchorPoint,
  }) async {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor ?? context.colors.background,
      barrierColor: barrierColor ?? context.colors.onBackground.withOpacity(.3),
      barrierLabel: barrierLabel,
      clipBehavior: clipBehavior,
      constraints: constraints,
      elevation: elevation,
      routeSettings: routeSettings,
      shape: shape,
      transitionAnimationController: transitionAnimationController,
      useSafeArea: useSafeArea,
      anchorPoint: anchorPoint,
      scrollControlDisabledMaxHeightRatio: 1,
      showDragHandle: showDragHandle,
      builder: (BuildContext context) {
        return child;
      },
    );
  }
}
