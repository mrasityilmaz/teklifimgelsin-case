part of '../offer_card_component.dart';

@immutable
final class _ExpandedDetailSection extends StatelessWidget {
  const _ExpandedDetailSection({required this.offerModel, required this.sponsoredOfferModel});

  final OfferModel? offerModel;
  final SponsoredOfferModel? sponsoredOfferModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: context.paddingNormalHorizontal + context.paddingNormalTop,
          child: Text.rich(
            TextSpan(
              children: _adHeaderText,
              style: context.textTheme.titleMedium!.copyWith(color: context.appColors.primaryBlackTextColor),
            ),
            style: context.textTheme.titleMedium!.copyWith(color: context.appColors.primaryBlackTextColor),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: context.paddingNormalHorizontal,
          child: Text.rich(
            TextSpan(
              children: _detailText,
            ),
          ),
        ),
      ],
    );
  }

  bool get isSponsored => sponsoredOfferModel != null;

  List<TextSpan>? get _detailText => (isSponsored ? (sponsoredOfferModel?.adDetails ?? '').decodeToTextSpans : offerModel?.detailNote?.decodeToTextSpans);

  List<TextSpan>? get _adHeaderText => sponsoredOfferModel?.adHeader?.decodeToTextSpans ?? [];
}
