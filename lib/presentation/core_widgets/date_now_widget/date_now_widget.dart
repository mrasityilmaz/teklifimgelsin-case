import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_coding_setup/core/extensions/context_extension.dart';

@immutable
final class DateNowWidget extends StatelessWidget {
  const DateNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: context.colors.background,
        backgroundColor: context.colors.background,
        minimumSize: Size.zero,
        padding: context.paddingLowVertical * .7,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: context.appColors.primaryGreyBorderColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.calendar_month_rounded,
            color: context.appColors.primaryBlackTextColor,
          ),
          SizedBox(width: context.lowValue),
          Text(
            DateFormat(
              'dd MMM yyyy',
            ).format(
              DateTime.now(),
            ),
            locale: const Locale('tr', 'TR'),
            style: context.textTheme.bodySmall?.copyWith(
              color: context.appColors.primaryBlackTextColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
