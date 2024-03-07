part of '../offer_card_component.dart';

@immutable
final class _OfferCardConstantBody extends StatelessWidget {
  const _OfferCardConstantBody({
    required this.expiry,
    required this.amount,
    this.offerModel,
    this.sponsoredOfferModel,
    this.isExpanded = false,
  }) : assert(offerModel != null || sponsoredOfferModel != null, 'Both offerModel and sponsoredOfferModel cannot be null at the same time or both cannot be not-null at the same time.');

  final OfferModel? offerModel;
  final SponsoredOfferModel? sponsoredOfferModel;
  final int expiry;
  final double amount;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLowHorizontal + context.paddingLowVertical * 1.2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isExpanded) ...[
            Flexible(
              child: _OfferCardExpandedBody(
                offerModel: offerModel,
                sponsoredOfferModel: sponsoredOfferModel,
                isExpanded: isExpanded,
                expiry: expiry,
                amount: amount,
              ),
            ),
          ] else ...[
            _OfferCardCollapsedBody(
              offerModel: offerModel,
              sponsoredOfferModel: sponsoredOfferModel,
              expiry: expiry,
              amount: amount,
            ),
          ],

          ///
          /// Bottom Buttons - Apply, Details
          ///
          _BottomButtonSection(
            isSponsored: sponsoredOfferModel != null,
          ),
        ],
      ),
    );
  }

  bool get isSponsored => sponsoredOfferModel != null;
}
