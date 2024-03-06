part of '../home_view.dart';

@immutable
final class _HomeTitleButtonSection extends StatelessWidget {
  const _HomeTitleButtonSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.screenPaddingHorizontal,
      child: Row(
        children: [
          const Expanded(
            child: DateNowWidget(),
          ),
          SizedBox(width: context.screenPadding.left * .5),
          Expanded(
            child: AdvancedButtonWidget.iconText(
              icon: Icon(
                Icons.replay_rounded,
                color: context.appColors.primaryBlueColor,
              ),
              text: 'Tekrar Hesapla',
              textStyle: context.textTheme.bodySmall?.copyWith(
                color: context.appColors.primaryBlueColor,
                fontWeight: FontWeight.w800,
              ),
              onPressed: () {},
              backgroundColor: context.appColors.primaryGreyBackgroundColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: context.appColors.primaryGreyBorderColor)),
            ),
          ),
        ],
      ),
    );
  }
}
