part of '../offer_card_component.dart';

@immutable
final class _LoanDetailRowSection extends StatelessWidget {
  const _LoanDetailRowSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormalVertical * .5,
      child: const Row(
        children: [
          Expanded(
            child: __OfferCardCenterDetailWidget(
              title: 'Aylık Taksit',
              subTitle: '₺1.500',
            ),
          ),
          Expanded(
            child: __OfferCardCenterDetailWidget(
              title: 'Faiz Oranı',
              subTitle: '%0',
            ),
          ),
          Expanded(
            child: __OfferCardCenterDetailWidget(
              title: 'Toplam Tutar',
              subTitle: '₺100.000*',
            ),
          ),
        ],
      ),
    );
  }
}

@immutable
final class __OfferCardCenterDetailWidget extends StatelessWidget {
  const __OfferCardCenterDetailWidget({
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          maxLines: 1,
          style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w400, color: context.appColors.primaryBlueColor),
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            subTitle,
            maxLines: 1,
            style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700, color: context.appColors.primaryBlueColor),
          ),
        ),
      ],
    );
  }
}
