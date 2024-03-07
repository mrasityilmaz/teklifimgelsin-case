part of '../offer_card_component.dart';

@immutable
final class _OfferCardExpandedBody extends StatelessWidget {
  const _OfferCardExpandedBody({
    required this.expiry,
    required this.amount,
    this.offerModel,
    this.sponsoredOfferModel,
    this.isExpanded = false,
  }) : assert(offerModel != null || sponsoredOfferModel != null, 'Both offerModel and sponsoredOfferModel cannot be null at the same time or both cannot be not-null at the same time.');

  final OfferModel? offerModel;
  final SponsoredOfferModel? sponsoredOfferModel;
  final bool isExpanded;
  final int expiry;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return ListView(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        ///
        /// Bank Detail - Bank Logo, Ad, Share
        ///
        _BankLogoAndDetailSection(
          bankId: _bankId,
          isSponsored: sponsoredOfferModel != null,
          isExpanded: isExpanded,
        ),

        ///
        /// Center Detail - Title, Amount, Term, Interest
        ///
        _LoanDetailRowSection(
          offerModel: offerModel,
          sponsoredOfferModel: sponsoredOfferModel,
          isExpanded: isExpanded,
          expiry: expiry,
          amount: amount,
        ),

        ///
        /// Expanded Detail Section - Ad Header, Ad Details
        ///
        _ExpandedDetailSection(offerModel: offerModel, sponsoredOfferModel: sponsoredOfferModel),
      ],
    );
  }

  int? get _bankId => sponsoredOfferModel?.bankId ?? offerModel?.bankId;

  bool get isSponsored => sponsoredOfferModel != null;
}
