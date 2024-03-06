part of '../offer_card_component.dart';

@immutable
final class _BottomButtonSection extends StatelessWidget {
  const _BottomButtonSection({this.isSponsored = false});
  final bool isSponsored;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormalHorizontal * .25,
      child: Row(
        children: [
          Expanded(
            child: AdvancedButtonWidget.iconText(
              icon: Icon(Icons.open_in_new_rounded, size: 18, color: context.colors.background),
              text: applyButtonText,
              onPressed: () {},
              padding: context.paddingLowVertical * 1.2,
              textStyle: context.textTheme.bodySmall?.copyWith(
                color: context.colors.background,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
              backgroundColor: context.appColors.primaryBlueAccentColor,
            ),
          ),
        ],
      ),
    );
  }

  String get applyButtonText => isSponsored ? 'Hemen Başvur' : 'Başvur';
}
