import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teklifimgelsin_case/core/extensions/context_extension.dart';
import 'package:teklifimgelsin_case/presentation/core_widgets/advanced_button/advanced_button_widget.dart';

@immutable
final class DateNowWidget extends StatelessWidget {
  const DateNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AdvancedButtonWidget.iconText(
      icon: Icon(
        Icons.calendar_month_rounded,
        color: context.appColors.primaryBlackTextColor,
      ),
      text: DateFormat('dd MMM yyyy').format(DateTime.now()),
      textStyle: context.textTheme.bodySmall?.copyWith(
        fontWeight: FontWeight.w700,
        color: context.appColors.primaryBlackTextColor,
      ),
      onPressed: null,
      showDisabledBacgroundColor: false,
      backgroundColor: context.colors.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: context.appColors.primaryGreyBorderColor)),
    );
  }
}
