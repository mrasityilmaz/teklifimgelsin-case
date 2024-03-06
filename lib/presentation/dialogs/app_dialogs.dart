import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_coding_setup/core/extensions/context_extension.dart';

final class AppDialogs {
  factory AppDialogs() => instance;

  const AppDialogs._internal();
  static const AppDialogs instance = AppDialogs._internal();

  ///
  /// Custom Success or Failure Dialog
  ///

  // Future<T?> showModalBottomSheetDialog<T>(
  //   BuildContext? context, {
  //   required Widget child,
  //   Color? backgroundColor,
  //   String? barrierLabel,
  //   double? elevation,
  //   ShapeBorder? shape,
  //   Clip? clipBehavior,
  //   BoxConstraints? constraints,
  //   Color? barrierColor,
  //   bool isScrollControlled = false,
  //   bool useRootNavigator = false,
  //   bool isDismissible = true,
  //   bool enableDrag = true,
  //   bool? showDragHandle,
  //   bool useSafeArea = false,
  //   RouteSettings? routeSettings,
  //   AnimationController? transitionAnimationController,
  //   Offset? anchorPoint,
  // }) async {
  //   final BuildContext ctx = context ?? locator<AppRouter>().navigatorKey.currentContext!;
  //   return showModalBottomSheet<T>(
  //     context: ctx,
  //     isScrollControlled: isScrollControlled,
  //     useRootNavigator: useRootNavigator,
  //     isDismissible: isDismissible,
  //     enableDrag: enableDrag,
  //     backgroundColor: backgroundColor ?? ctx.colors.primary,
  //     barrierColor: barrierColor ?? ctx.colors.onBackground.withOpacity(.3),
  //     barrierLabel: barrierLabel,
  //     clipBehavior: clipBehavior,
  //     constraints: constraints,
  //     elevation: elevation,
  //     routeSettings: routeSettings,
  //     shape: shape,
  //     transitionAnimationController: transitionAnimationController,
  //     useSafeArea: useSafeArea,
  //     anchorPoint: anchorPoint,
  //     showDragHandle: showDragHandle,
  //     builder: (BuildContext context) {
  //       return child;
  //     },
  //   );
  // }

  ///
  /// Custom Progress Show Dialog Function
  ///

  FutureOr<T?> showAnimatedDialog<T>(BuildContext context, {required Widget child, bool barrierDismissible = true, Alignment alignment = Alignment.center, Color? barrierColor}) async {
    return showDialog(context: context, builder: (context) => child, barrierDismissible: barrierDismissible, barrierColor: barrierColor ?? context.colors.scrim.withOpacity(.4));
    // return showAnimatedDialog<T?>(
    //   context: context,
    //   duration: const Duration(milliseconds: 400),
    //   curve: Curves.easeInOutExpo,
    //   axis: Axis.vertical,
    //   alignment: alignment,
    //   barrierColor: barrierColor ?? context.colors.scrim.withOpacity(.4),
    //   barrierDismissible: barrierDismissible,
    //   builder: (context) => child,
    // );
  }
}
