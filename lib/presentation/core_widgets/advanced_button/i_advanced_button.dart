part of 'advanced_button_widget.dart';

@immutable
sealed class _IAdvancedButtonWidget extends StatelessWidget {
  const _IAdvancedButtonWidget({
    required this.onPressed,
    required this.type,
    required this.backgroundColor,
    required this.text,
    required this.child,
    required this.icon,
    this.padding,
    this.shape,
    this.textStyle,
    this.expand = false,
  });

  final void Function()? onPressed;
  final _AdvancedButtonType type;
  final Widget child;
  final Widget icon;
  final String text;
  final EdgeInsetsGeometry? padding;

  final Color? backgroundColor;
  final TextStyle? textStyle;
  final OutlinedBorder? shape;
  final bool expand;
}

enum _AdvancedButtonType { text, icon, iconText, widget }
