part of '../offer_card_component.dart';

@immutable
final class _OfferCardConstantBody extends StatelessWidget {
  const _OfferCardConstantBody({
    this.offerModel,
    this.sponsoredOfferModel,
    this.isExpanded = false,
  }) : assert(offerModel != null || sponsoredOfferModel != null, 'Both offerModel and sponsoredOfferModel cannot be null at the same time or both cannot be not-null at the same time.');

  final OfferModel? offerModel;
  final SponsoredOfferModel? sponsoredOfferModel;
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
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
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
                  ),

                  Padding(
                    padding: context.paddingNormal,
                    child: Text.rich(
                      TextSpan(
                        children: _detailText
                            ?.map(
                              (e) => TextSpan(
                                text: '$e\n'.replaceAll('**', '').replaceAll('*', '').replaceAll('-', ''),
                                style: context.textTheme.titleSmall?.copyWith(
                                  fontWeight: e.contains('**') ? FontWeight.w700 : FontWeight.w400,
                                  fontStyle: e.contains('*') && !e.contains('**') ? FontStyle.italic : FontStyle.normal,
                                  color: context.appColors.primaryBlackTextColor,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
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

  int? get _bankId => sponsoredOfferModel?.bankId ?? offerModel?.bankId;

  bool get isSponsored => sponsoredOfferModel != null;

  List<String>? get _detailText => isSponsored ? '${sponsoredOfferModel?.adHeader ?? ''}\n${sponsoredOfferModel?.adDetails ?? ''}'.decodeToHtmlTag : offerModel?.detailNote?.decodeToHtmlTag;
}
