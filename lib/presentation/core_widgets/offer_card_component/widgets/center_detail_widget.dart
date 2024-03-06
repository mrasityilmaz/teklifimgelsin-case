part of '../offer_card_component.dart';

@immutable
final class _LoanDetailRowSection extends StatelessWidget {
  const _LoanDetailRowSection({this.offerModel, this.sponsoredOfferModel});

  final OfferModel? offerModel;
  final SponsoredOfferModel? sponsoredOfferModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormalVertical * .5,
      child: Row(
        children: [
          Expanded(
            child: __OfferCardCenterDetailWidget(
              title: monthlyText,
              subTitle: loanDetailModel.monthlyPayment,
            ),
          ),
          Expanded(
            child: __OfferCardCenterDetailWidget(
              title: interestRateText,
              subTitle: loanDetailModel.interestRate,
              icon: interestRateIcon(context),
              onPressedIcon: interestRateOnPressed(),
            ),
          ),
          Expanded(
            child: __OfferCardCenterDetailWidget(
              title: totalPaymentText,
              subTitle: loanDetailModel.totalPayment,
            ),
          ),
        ],
      ),
    );
  }

  bool get isSponsored => sponsoredOfferModel != null;

  OfferLoanDetailModel get loanDetailModel => isSponsored
      ? OfferLoanDetailModel.fromString(adContent: sponsoredOfferModel!.adContent)
      : OfferLoanDetailModel.fromLoanDetail(interestRate: offerModel?.interestRate, mount: 12, amountValue: 100000);

  String get monthlyText => isSponsored ? 'Aylık Taksit' : 'Taksit';

  String get interestRateText => isSponsored ? 'Faiz Oranı' : 'Oran';

  String get totalPaymentText => isSponsored ? 'Toplam Tutar' : 'Toplam Maliyet';

  Icon? interestRateIcon(BuildContext context) => isSponsored
      ? null
      : Icon(
          Icons.info_outline_rounded,
          color: context.appColors.primaryBlueColor,
          size: 18,
        );

  VoidCallback? interestRateOnPressed() => isSponsored ? null : () => debugPrint('Interest Rate Info');
}

@immutable
final class __OfferCardCenterDetailWidget extends StatelessWidget {
  const __OfferCardCenterDetailWidget({
    required this.title,
    required this.subTitle,
    this.icon,
    this.onPressedIcon,
  });
  final String title;
  final String subTitle;
  final Icon? icon;
  final VoidCallback? onPressedIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressedIcon,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Padding(padding: const EdgeInsets.only(top: 1), child: icon),
                SizedBox(width: context.lowValue * .2),
              ],
              Text(
                title,
                maxLines: 1,
                style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w400, color: context.appColors.primaryBlueColor),
              ),
            ],
          ),
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
