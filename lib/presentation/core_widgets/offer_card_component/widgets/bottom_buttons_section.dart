part of '../offer_card_component.dart';

@immutable
final class _BottomButtonsSection extends StatelessWidget {
  const _BottomButtonsSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: AdvancedButtonWidget.text(
            text: 'Detay',
            onPressed: () {},
            backgroundColor: context.appColors.primaryGreyBackgroundColor,
            textStyle: context.textTheme.bodySmall?.copyWith(
              color: context.appColors.primaryBlueColor,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: context.appColors.primaryGreyBorderColor)),
          ),
        ),
        SizedBox(
          width: context.lowValue,
        ),
        Expanded(
          flex: 6,
          child: AdvancedButtonWidget.text(
            text: 'Başvur',
            onPressed: () {},
            textStyle: context.textTheme.bodySmall?.copyWith(
              color: context.colors.background,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
            backgroundColor: context.appColors.primaryBlueAccentColor,
          ),
        ),
      ],
    );
  }
}
