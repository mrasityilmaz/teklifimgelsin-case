part of '../../offer_card_component.dart';

@immutable
final class _LoanDetailRowSection extends StatelessWidget {
  const _LoanDetailRowSection({this.offerModel, this.sponsoredOfferModel, this.isExpanded = false, this.expiry = 0, this.amount = 0.0});

  final OfferModel? offerModel;
  final SponsoredOfferModel? sponsoredOfferModel;
  final bool isExpanded;
  final int expiry;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (sponsoredOfferModel != null) ...[
          __SponsoredDetailRows(
            sponsoredOfferModel: sponsoredOfferModel,
          ),
        ] else ...[
          __DetailRows(
            offerModel: offerModel,
            isExpanded: isExpanded,
            expiry: expiry,
            amount: amount,
          ),
        ],
      ],
    );
  }
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
                style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w400, color: context.appColors.primaryBlackTextColor),
              ),
            ],
          ),
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            subTitle,
            maxLines: 1,
            style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700, color: context.appColors.primaryBlackTextColor),
          ),
        ),
      ],
    );
  }
}
