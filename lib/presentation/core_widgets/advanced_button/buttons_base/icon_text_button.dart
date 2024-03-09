part of '../advanced_button_widget.dart';

@immutable
final class _IconTextButton extends StatelessWidget {
  const _IconTextButton({
    required this.icon,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.shape,
    this.padding,
    this.textStyle,
    this.expand = false,
    this.showDisabledBacgroundColor = true,
  });

  final Widget icon;
  final String text;

  final TextStyle? textStyle;

  final void Function()? onPressed;
  final Color? backgroundColor;
  final OutlinedBorder? shape;

  final EdgeInsetsGeometry? padding;
  final bool expand;
  final bool showDisabledBacgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: icon,
      label: Text(
        text,
        style: textStyle?.copyWith(color: textStyle?.color ?? context.colors.onPrimary) ?? context.textTheme.bodyMedium?.copyWith(color: textStyle?.color ?? context.colors.onPrimary),
      ),
      onPressed: onPressed != null
          ? () {
              onPressed!.call();
            }
          : null,
      style: TextButton.styleFrom(
        disabledBackgroundColor: showDisabledBacgroundColor ? context.appColors.primaryGreyBorderColor.withOpacity(.6) : null,
        backgroundColor: backgroundColor ?? context.colors.primary,
        shape: shape ?? RoundedRectangleBorder(borderRadius: context.radius12),
        minimumSize: expand ? const Size(double.infinity, kMinInteractiveDimension) : null,
        fixedSize: expand ? const Size(double.infinity, kMinInteractiveDimension) : null,
        padding: padding,
        elevation: 0,
        splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
      ),
    );
  }
}
