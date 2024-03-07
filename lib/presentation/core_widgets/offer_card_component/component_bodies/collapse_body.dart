part of '../offer_card_component.dart';

@immutable
final class _OfferCardCollapsedBody extends StatelessWidget {
  const _OfferCardCollapsedBody({
    required this.expiry,
    required this.amount,
    this.offerModel,
    this.sponsoredOfferModel,
  }) : assert(offerModel != null || sponsoredOfferModel != null, 'Both offerModel and sponsoredOfferModel cannot be null at the same time or both cannot be not-null at the same time.');

  final OfferModel? offerModel;
  final SponsoredOfferModel? sponsoredOfferModel;
  final int expiry;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///
        /// Bank Detail - Bank Logo, Ad, Share
        ///
        _BankLogoAndDetailSection(
          bankId: _bankId,
          isSponsored: sponsoredOfferModel != null,
        ),

        ///
        /// Center Detail - Title, Amount, Term, Interest
        ///
        _LoanDetailRowSection(
          offerModel: offerModel,
          sponsoredOfferModel: sponsoredOfferModel,
          expiry: expiry,
          amount: amount,
        ),
      ],
    );
  }

  int? get _bankId => sponsoredOfferModel?.bankId ?? offerModel?.bankId;

  bool get isSponsored => sponsoredOfferModel != null;
}
