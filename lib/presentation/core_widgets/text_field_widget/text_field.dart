import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teklifimgelsin_case/core/extensions/context_extension.dart';
import 'package:teklifimgelsin_case/shared/theme/color_scheme.dart';

@immutable
final class CustomTextFieldWidget extends StatelessWidget {
  CustomTextFieldWidget({
    required this.controller,
    required this.hintText,
    super.key,
    this.autofillHints,
    this.textStyle,
    this.hintTextStyle,
    this.textColor,
    this.labelTextColor,
    this.isFill = true,
    this.fillColor,
    this.isDense,
    this.hintTextAlign,
    this.isObscureText,
    this.enabled,
    this.onChanged,
    this.onTap,
    this.maxLines = 1,
    this.maxLength = 500,
    this.onTapOutside,
    this.readOnly,
    this.expands,
    this.contentPad,
    this.borderRadius,
    this.prefixIcon,
    this.suffixIcon,
    this.enableInteractiveSelection,
    this.inputFormatter,
    this.autoCorrect,
    this.onSubmitted,
    this.textInputAction,
    this.textInputType,
    this.textCapitalization,
    this.prefixText,
    this.suffixText,
    this.prefixTextStyle,
    this.suffixTextStyle,
  })  : borderColor = AppColorScheme.instance.primaryBlueAccentColor,
        hintTextColor = AppColorScheme.instance.primaryBlackTextColor;

  final Iterable<String>? autofillHints;
  final TextEditingController controller;
  final String hintText;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;

  final String? prefixText;
  final String? suffixText;

  final TextStyle? prefixTextStyle;
  final TextStyle? suffixTextStyle;

  final Color? textColor;
  final Color? hintTextColor;

  final Color? labelTextColor;
  final bool? isFill;
  final Color? fillColor;
  final Color? borderColor;
  final bool? isDense;

  final TextAlign? hintTextAlign;

  final bool? isObscureText;

  final bool? enabled;
  final void Function(String)? onChanged;

  final void Function()? onTap;
  final int? maxLines;
  final int maxLength;

  final void Function()? onTapOutside;

  final bool? readOnly;
  final bool? expands;

  final EdgeInsetsGeometry? contentPad;
  final BorderRadius? borderRadius;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final bool? enableInteractiveSelection;
  final List<TextInputFormatter>? inputFormatter;
  final bool? autoCorrect;

  final void Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final TextCapitalization? textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) {
        onTapOutside?.call();
        FocusManager.instance.primaryFocus?.unfocus();

        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      autofillHints: autofillHints,
      autocorrect: autoCorrect == true,
      controller: controller,
      enabled: enabled,
      enableInteractiveSelection: enableInteractiveSelection,
      inputFormatters: inputFormatter,
      keyboardType: textInputType,
      maxLength: maxLength,
      maxLines: expands == true ? null : maxLines,
      minLines: expands == true ? null : 1,
      expands: expands == true,
      readOnly: readOnly ?? false,
      onChanged: onChanged,
      onTap: onTap,
      obscureText: isObscureText ?? false,
      obscuringCharacter: '*',
      onSubmitted: (value) {
        onSubmitted?.call(value);
      },
      style: textStyle ?? context.textTheme.titleMedium,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      textInputAction: textInputAction ?? TextInputAction.next,
      textAlign: hintTextAlign ?? TextAlign.start,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        suffixIconConstraints: const BoxConstraints(),
        prefixIconConstraints: const BoxConstraints(),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixText: prefixText,
        suffixText: suffixText,
        prefixStyle: prefixTextStyle ?? textStyle,
        suffixStyle: suffixTextStyle ?? textStyle,
        filled: fillColor != null,
        contentPadding: context.paddingLow * .8,
        counterText: expands == true ? null : '',
        isCollapsed: true,
        hintText: hintText,
        hintStyle: hintTextStyle ?? context.textTheme.titleMedium,
        fillColor: fillColor ?? context.colors.background,
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          borderSide: BorderSide(
            color: borderColor ?? context.appColors.primaryGreyBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          borderSide: BorderSide(
            color: borderColor ?? context.appColors.primaryBlueAccentColor,
          ),
        ),
      ),
    );
  }
}
