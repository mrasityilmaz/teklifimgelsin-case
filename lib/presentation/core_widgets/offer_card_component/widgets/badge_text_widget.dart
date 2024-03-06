part of '../offer_card_component.dart';

@immutable
final class _BadgeTextWidget extends StatelessWidget {
  const _BadgeTextWidget({required this.text, this.isSponsored = false});
  final String text;
  final bool isSponsored;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kMinInteractiveDimension * .65,
      padding: context.paddingLowHorizontal * .5,
      decoration: ShapeDecoration(
        color: context.colors.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: context.appColors.primaryOrangeColor, width: 1.5)),
      ),
      child: Center(
        child: Row(
          children: [
            if (!isSponsored) ...[
              Icon(CupertinoIcons.sparkles, size: 18, color: context.appColors.primaryOrangeColor),
              const SizedBox(
                width: 2,
              ),
            ],
            Text(text, style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700, color: context.appColors.primaryOrangeColor)),
          ],
        ),
      ),
    );
  }
}
