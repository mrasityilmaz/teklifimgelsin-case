part of '../offer_card_component.dart';

@immutable
final class _BadgeTextWidget extends StatelessWidget {
  const _BadgeTextWidget({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kMinInteractiveDimension * .65,
      padding: context.paddingLowHorizontal * .5,
      decoration: ShapeDecoration(
        color: context.colors.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: context.appColors.primaryOrangeColor, width: 1.5)),
      ),
      child: Center(child: Text(text, style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700, color: context.appColors.primaryOrangeColor))),
    );
  }
}
