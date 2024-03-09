import 'package:flutter/material.dart';
import 'package:my_coding_setup/core/extensions/context_extension.dart';

part 'buttons_base/icon_button.dart';
part 'buttons_base/icon_text_button.dart';
part 'buttons_base/text_button.dart';
part 'buttons_base/widget_button.dart';
part 'i_advanced_button.dart';

@immutable
final class AdvancedButtonWidget extends _IAdvancedButtonWidget {
  const AdvancedButtonWidget({
    required super.child,
    required super.onPressed,
    super.backgroundColor,
    super.shape,
    super.padding,
    super.expand = false,
    super.showDisabledBacgroundColor,
  }) : super(
          type: _AdvancedButtonType.widget,
          text: '',
          icon: const SizedBox(),
          textStyle: null,
        );

  const AdvancedButtonWidget.icon({
    required super.icon,
    required super.onPressed,
    super.backgroundColor,
    super.shape,
    super.padding,
  }) : super(
          type: _AdvancedButtonType.icon,
          text: '',
          child: const SizedBox(),
          textStyle: null,
        );

  const AdvancedButtonWidget.iconText({
    required super.icon,
    required super.text,
    required super.onPressed,
    super.textStyle,
    super.backgroundColor,
    super.shape,
    super.padding,
    super.expand = false,
    super.showDisabledBacgroundColor,
  }) : super(
          type: _AdvancedButtonType.iconText,
          child: const SizedBox(),
        );

  const AdvancedButtonWidget.text({
    required super.text,
    required super.onPressed,
    super.backgroundColor,
    super.shape,
    super.textStyle,
    super.padding,
    super.expand = false,
    super.showDisabledBacgroundColor,
  }) : super(
          type: _AdvancedButtonType.text,
          child: const SizedBox(),
          icon: const SizedBox(),
        );

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case _AdvancedButtonType.text:
        return _TextButton(
          text: text,
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          shape: shape,
          textStyle: textStyle,
          padding: padding,
          expand: expand,
          showDisabledBacgroundColor: showDisabledBacgroundColor,
        );
      case _AdvancedButtonType.icon:
        return _IconButton(
          icon: icon,
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          padding: padding,
          shape: shape,
        );
      case _AdvancedButtonType.iconText:
        return _IconTextButton(
          icon: icon,
          text: text,
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          padding: padding,
          shape: shape,
          expand: expand,
          textStyle: textStyle,
          showDisabledBacgroundColor: showDisabledBacgroundColor,
        );
      case _AdvancedButtonType.widget:
        return _WidgetButton(
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          padding: padding,
          shape: shape,
          expand: expand,
          showDisabledBacgroundColor: showDisabledBacgroundColor,
          child: child,
        );
    }
  }
}
