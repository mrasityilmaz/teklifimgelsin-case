// ignore_for_file: empty_catches

part of '../advanced_button_widget.dart';

@immutable
final class _IconButton extends StatelessWidget {
  const _IconButton({
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.shape,
    this.padding,
  });

  final Widget icon;

  final void Function()? onPressed;
  final Color? backgroundColor;
  final OutlinedBorder? shape;

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onPressed != null
          ? () async {
              onPressed!.call();
            }
          : null,
      style: IconButton.styleFrom(
        backgroundColor: backgroundColor ?? context.colors.primary,
        shape: shape ?? RoundedRectangleBorder(borderRadius: context.radius12),
        padding: padding,
        elevation: 0,
        splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
      ),
    );
  }
}
