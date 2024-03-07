part of '../../offer_card_component.dart';

@immutable
final class __SponsoredDetailRows extends StatelessWidget {
  const __SponsoredDetailRows({this.sponsoredOfferModel});

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

  SponsoredOfferLoanDetailModel get loanDetailModel => SponsoredOfferLoanDetailModel.fromString(adContent: sponsoredOfferModel!.adContent);

  String get monthlyText => 'Aylık Taksit';

  String get interestRateText => 'Faiz Oranı';

  String get totalPaymentText => 'Toplam Tutar';
}
