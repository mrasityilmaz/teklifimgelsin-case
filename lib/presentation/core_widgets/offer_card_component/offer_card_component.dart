import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_coding_setup/core/extensions/context_extension.dart';
import 'package:my_coding_setup/core/extensions/string_extension.dart';
import 'package:my_coding_setup/data/models/offer_loan_detail_model/offer_loan_detail_model.dart';
import 'package:my_coding_setup/data/models/offer_model/offer_model.dart';
import 'package:my_coding_setup/data/models/sponsored_offer_model/sponsored_offer_model.dart';
import 'package:my_coding_setup/presentation/core_widgets/advanced_button/advanced_button_widget.dart';

part 'component_bodies/constant_body.dart';
part 'widgets/badge_text_widget.dart';
part 'widgets/bank_logo_and_detail_section.dart';
part 'widgets/bottom_button_section.dart';
part 'widgets/center_detail_widget.dart';

@immutable
final class OfferCardWidget extends StatelessWidget {
  const OfferCardWidget({super.key, this.sponsoredOfferModel, this.offerModel, this.onTap, this.isExpanded = false});
  final SponsoredOfferModel? sponsoredOfferModel;
  final OfferModel? offerModel;
  final VoidCallback? onTap;

  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      tag: sponsoredOfferModel?.adUtmLink ?? offerModel?.bankId ?? '',
      child: Material(
        type: MaterialType.transparency,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          constraints: isExpanded
              ? BoxConstraints(
                  maxHeight: context.height * .55,
                )
              : null,
          margin: context.screenPaddingHorizontal + context.paddingNormalBottom + _ifBadgeTextExist(context),
          padding: EdgeInsets.zero,
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: onTap,
            splashFactory: InkSplash.splashFactory,
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(isExpanded ? 20 : 16),
                border: Border.all(
                  color: context.appColors.primaryGreyBorderColor,
                  width: 1.5,
                ),
                color: context.appColors.primaryWhiteBackgroundColor,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  _OfferCardConstantBody(
                    sponsoredOfferModel: sponsoredOfferModel,
                    offerModel: offerModel,
                    isExpanded: isExpanded,
                  ),

                  ///
                  /// Badge Text its only visible if badgeText is not empty
                  ///
                  if (_hasBadgeText) ...[
                    Positioned(
                      top: -kMinInteractiveDimension * .65 * .5,
                      child: _BadgeTextWidget(text: _badgeText, isSponsored: sponsoredOfferModel != null),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///
  /// If badge text exist, return padding, else return zero
  ///
  EdgeInsets _ifBadgeTextExist(BuildContext context) => _hasBadgeText ? context.paddingNormalTop * .25 : EdgeInsets.zero;

  bool get _hasBadgeText => (sponsoredOfferModel?.badgeText?.isNotEmpty == true) || (offerModel?.note?.isNotEmpty == true);

  String get _badgeText => _hasBadgeText ? sponsoredOfferModel?.badgeText ?? offerModel?.note ?? '' : '';
}
