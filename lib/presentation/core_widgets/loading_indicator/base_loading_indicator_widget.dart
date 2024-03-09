import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_coding_setup/core/extensions/context_extension.dart';

final class BaseLoadingIndicator extends StatelessWidget {
  const BaseLoadingIndicator({super.key, this.progressWidget, this.hasBackgroundColor = true});

  final Widget? progressWidget;
  final bool hasBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      decoration: BoxDecoration(
        color: hasBackgroundColor ? context.colors.shadow.withOpacity(.3) : Colors.transparent,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: ClipRRect(
          child: Center(
            child: SizedBox(
              height: kMinInteractiveDimension,
              width: kMinInteractiveDimension,
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 3.5,
                valueColor: AlwaysStoppedAnimation<Color>(context.appColors.primaryBlueAccentColor),
                backgroundColor: context.appColors.primaryBlueAccentColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
