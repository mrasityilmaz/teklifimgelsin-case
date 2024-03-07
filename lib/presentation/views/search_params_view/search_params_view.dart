import 'package:flutter/material.dart';
import 'package:my_coding_setup/core/extensions/context_extension.dart';
import 'package:my_coding_setup/core/extensions/string_extension.dart';
import 'package:my_coding_setup/core/parsers__and_formatters/text_formatter.dart';
import 'package:my_coding_setup/presentation/core_widgets/text_field_widget/text_field.dart';
import 'package:my_coding_setup/vendor/slider_shape_override.dart';

@immutable
final class SearchParamsView extends StatelessWidget {
  const SearchParamsView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController amountController = TextEditingController(text: '1.000'.withTLSymbol);
    final TextEditingController monthController = TextEditingController(text: '1 Ay');
    return SafeArea(
      minimum: context.adaptiveScreenPaddingBottom,
      child: Padding(
        padding: context.screenPadding,
        child: AnimatedSize(
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
          reverseDuration: const Duration(milliseconds: 500),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFieldWidget(
                controller: amountController,
                hintText: '',
                textCapitalization: TextCapitalization.characters,
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.done,
                fillColor: context.appColors.primaryGreyBackgroundColor.withOpacity(.05),
                textStyle: context.textTheme.titleLarge?.copyWith(
                  color: context.appColors.primaryBlackTextColor,
                  fontWeight: FontWeight.w400,
                ),
                inputFormatter: [CustomAmountFormatter()],
                suffixIcon: Container(
                  padding: context.paddingLowVertical * .5 + context.paddingLowHorizontal,
                  margin: EdgeInsets.only(right: (context.paddingLowHorizontal * .8).right),
                  decoration: BoxDecoration(
                    color: context.appColors.primaryBlueAccentColor.withOpacity(.15),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: context.appColors.primaryGreyBackgroundColor, width: .7),
                  ),
                  child: Text(
                    'Tutar',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.appColors.primaryBlueAccentColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SliderTheme(
                data: SliderThemeData(
                  trackShape: CustomTrackShape(),
                  trackHeight: 3,
                  inactiveTrackColor: context.appColors.primaryGreyBorderColor.withOpacity(.5),
                  activeTrackColor: context.appColors.primaryBlueAccentColor,
                  thumbColor: context.appColors.primaryBlueAccentColor,
                  thumbShape: CustomSliderThumbShape(
                    borderColor: context.colors.background,
                    elevation: 8,
                    enabledThumbRadius: 7,
                    thumbBorderWidth: 5,
                  ),
                ),
                child: Padding(
                  padding: context.paddingLowHorizontal * .5,
                  child: Slider(
                    value: 1000,
                    divisions: 1000,
                    min: 1000,
                    max: 300000,
                    onChanged: (p0) {},
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFieldWidget(
                maxLength: 5,
                controller: monthController,
                hintText: '',
                textCapitalization: TextCapitalization.characters,
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.done,
                fillColor: context.appColors.primaryGreyBackgroundColor.withOpacity(.05),
                textStyle: context.textTheme.titleLarge?.copyWith(
                  color: context.appColors.primaryBlackTextColor,
                  fontWeight: FontWeight.w400,
                ),
                inputFormatter: [CustomMonthFormatter()],
                suffixIcon: Container(
                  padding: context.paddingLowVertical * .5 + context.paddingLowHorizontal,
                  margin: EdgeInsets.only(right: (context.paddingLowHorizontal * .8).right),
                  decoration: BoxDecoration(
                    color: context.appColors.primaryBlueAccentColor.withOpacity(.15),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: context.appColors.primaryGreyBackgroundColor, width: .7),
                  ),
                  child: Text(
                    'Vade',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.appColors.primaryBlueAccentColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SliderTheme(
                data: SliderThemeData(
                  trackShape: CustomTrackShape(),
                  trackHeight: 3,
                  inactiveTrackColor: context.appColors.primaryGreyBorderColor.withOpacity(.5),
                  activeTrackColor: context.appColors.primaryBlueAccentColor,
                  thumbColor: context.appColors.primaryBlueAccentColor,
                  thumbShape: CustomSliderThumbShape(
                    borderColor: context.colors.background,
                    elevation: 8,
                    enabledThumbRadius: 7,
                    thumbBorderWidth: 5,
                  ),
                ),
                child: Padding(
                  padding: context.paddingLowHorizontal * .5,
                  child: Slider(
                    value: 1,
                    divisions: 1,
                    min: 1,
                    max: 36,
                    onChanged: (p0) {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return DraggableScrollableSheet(
      maxChildSize: .8,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: context.screenPaddingHorizontal + context.paddingNormalVertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextFieldWidget(
                  controller: TextEditingController(text: '1.000'.withTLSymbol),
                  hintText: '',
                  textCapitalization: TextCapitalization.characters,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  fillColor: context.appColors.primaryGreyBackgroundColor.withOpacity(.05),
                  textStyle: context.textTheme.titleLarge?.copyWith(
                    color: context.appColors.primaryBlackTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                  inputFormatter: [CustomAmountFormatter()],
                  suffixIcon: Container(
                    padding: context.paddingLowVertical * .5 + context.paddingLowHorizontal,
                    margin: EdgeInsets.only(right: (context.paddingLowHorizontal * .8).right),
                    decoration: BoxDecoration(
                      color: context.appColors.primaryBlueAccentColor.withOpacity(.15),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: context.appColors.primaryGreyBackgroundColor, width: .7),
                    ),
                    child: Text(
                      'Tutar',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.appColors.primaryBlueAccentColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SliderTheme(
                  data: SliderThemeData(
                    trackShape: CustomTrackShape(),
                    trackHeight: 3,
                    inactiveTrackColor: context.appColors.primaryGreyBorderColor.withOpacity(.5),
                    activeTrackColor: context.appColors.primaryBlueAccentColor,
                    thumbColor: context.appColors.primaryBlueAccentColor,
                    thumbShape: CustomSliderThumbShape(
                      borderColor: context.colors.background,
                      elevation: 8,
                      enabledThumbRadius: 7,
                      thumbBorderWidth: 5,
                    ),
                  ),
                  child: Padding(
                    padding: context.paddingLowHorizontal * .5,
                    child: Slider(
                      value: 1000,
                      divisions: 1000,
                      min: 1000,
                      max: 300000,
                      onChanged: (p0) {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldWidget(
                  maxLength: 5,
                  controller: TextEditingController(text: '1 Ay'),
                  hintText: '',
                  textCapitalization: TextCapitalization.characters,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  fillColor: context.appColors.primaryGreyBackgroundColor.withOpacity(.05),
                  textStyle: context.textTheme.titleLarge?.copyWith(
                    color: context.appColors.primaryBlackTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                  inputFormatter: [CustomMonthFormatter()],
                  suffixIcon: Container(
                    padding: context.paddingLowVertical * .5 + context.paddingLowHorizontal,
                    margin: EdgeInsets.only(right: (context.paddingLowHorizontal * .8).right),
                    decoration: BoxDecoration(
                      color: context.appColors.primaryBlueAccentColor.withOpacity(.15),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: context.appColors.primaryGreyBackgroundColor, width: .7),
                    ),
                    child: Text(
                      'Vade',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.appColors.primaryBlueAccentColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SliderTheme(
                  data: SliderThemeData(
                    trackShape: CustomTrackShape(),
                    trackHeight: 3,
                    inactiveTrackColor: context.appColors.primaryGreyBorderColor.withOpacity(.5),
                    activeTrackColor: context.appColors.primaryBlueAccentColor,
                    thumbColor: context.appColors.primaryBlueAccentColor,
                    thumbShape: CustomSliderThumbShape(
                      borderColor: context.colors.background,
                      elevation: 8,
                      enabledThumbRadius: 7,
                      thumbBorderWidth: 5,
                    ),
                  ),
                  child: Padding(
                    padding: context.paddingLowHorizontal * .5,
                    child: Slider(
                      value: 1,
                      divisions: 1,
                      min: 1,
                      max: 36,
                      onChanged: (p0) {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
