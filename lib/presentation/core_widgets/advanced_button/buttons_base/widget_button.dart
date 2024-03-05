part of '../advanced_button_widget.dart';

@immutable
final class _WidgetButton extends StatelessWidget {
  const _WidgetButton({
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.shape,
    this.padding,
    this.expand = false,
  });

  final Widget child;

  final void Function()? onPressed;
  final Color? backgroundColor;
  final OutlinedBorder? shape;

  final EdgeInsetsGeometry? padding;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed != null
          ? () {
              onPressed!.call();
            }
          : null,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor ?? context.colors.primary,
        shape: shape ?? RoundedRectangleBorder(borderRadius: context.radius8),
        minimumSize: expand ? const Size(double.infinity, kMinInteractiveDimension) : null,
        fixedSize: expand ? const Size(double.infinity, kMinInteractiveDimension) : null,
        padding: padding,
        elevation: 0,
        splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
      ),
      child: child,
    );
  }
}
