part of '../advanced_button_widget.dart';

@immutable
final class _TextButton extends StatelessWidget {
  const _TextButton({
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.backgroundColor,
    this.shape,
    this.padding,
    this.expand = false,
    this.showDisabledBacgroundColor = true,
  });

  final String text;

  final void Function()? onPressed;
  final Color? backgroundColor;
  final OutlinedBorder? shape;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final bool expand;
  final bool showDisabledBacgroundColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed != null
          ? () {
              onPressed!.call();
            }
          : null,
      style: TextButton.styleFrom(
        disabledBackgroundColor: showDisabledBacgroundColor ? context.appColors.primaryGreyBorderColor.withOpacity(.6) : null,
        backgroundColor: backgroundColor ?? context.colors.primary,
        minimumSize: expand ? const Size(double.infinity, kMinInteractiveDimension) : null,
        fixedSize: expand ? const Size(double.infinity, kMinInteractiveDimension) : null,
        shape: shape ?? RoundedRectangleBorder(borderRadius: context.radius12),
        padding: padding,
        elevation: 0,
        splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
      ),
      child: Text(
        text,
        style: textStyle?.copyWith(color: textStyle?.color ?? context.colors.onPrimary) ?? context.textTheme.bodyMedium?.copyWith(color: textStyle?.color ?? context.colors.onPrimary),
      ),
    );
  }
}
