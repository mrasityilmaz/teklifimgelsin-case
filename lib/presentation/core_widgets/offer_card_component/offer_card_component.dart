import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teklifimgelsin_case/core/extensions/context_extension.dart';
import 'package:teklifimgelsin_case/core/extensions/num_extension.dart';
import 'package:teklifimgelsin_case/core/extensions/string_extension.dart';
import 'package:teklifimgelsin_case/data/models/offer_loan_detail_model/offer_loan_detail_model.dart';
import 'package:teklifimgelsin_case/data/models/offer_loan_detail_model/sponsored_offer_loan_detail_model.dart';
import 'package:teklifimgelsin_case/data/models/offer_model/offer_model.dart';
import 'package:teklifimgelsin_case/data/models/sponsored_offer_model/sponsored_offer_model.dart';
import 'package:teklifimgelsin_case/presentation/core_widgets/advanced_button/advanced_button_widget.dart';

part 'component_bodies/collapse_body.dart';
part 'component_bodies/constant_body.dart';
part 'component_bodies/expand_body.dart';
part 'widgets/badge_text_widget.dart';
part 'widgets/bank_logo_and_detail_section.dart';
part 'widgets/bottom_button_section.dart';
part 'widgets/details_row/detail_base_widget.dart';
part 'widgets/details_row/detail_widget.dart';
part 'widgets/details_row/sponsored_detail_widget.dart';
part 'widgets/expanded_detail_section.dart';

@immutable
final class OfferCardWidget extends StatelessWidget {
  const OfferCardWidget({required this.expiry, required this.amount, super.key, this.sponsoredOfferModel, this.offerModel, this.isExpanded = false, this.isDisabled = false});
  final SponsoredOfferModel? sponsoredOfferModel;
  final OfferModel? offerModel;
  final int expiry;
  final double amount;

  final bool isExpanded;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isDisabled,
      child: Opacity(
        opacity: isDisabled ? .25 : 1,
        child: Hero(
          transitionOnUserGestures: true,
          tag: sponsoredOfferModel?.adUtmLink ?? offerModel?.bankId ?? '',
          child: Material(
            type: MaterialType.transparency,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              constraints: isExpanded
                  ? BoxConstraints(
                      maxHeight: context.height * .65,
                    )
                  : null,
              margin: context.screenPaddingHorizontal + context.paddingNormalBottom + _ifBadgeTextExist(context),
              padding: EdgeInsets.zero,
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: isExpanded ? null : () => onTap(context),
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
                        expiry: expiry,
                        amount: amount,
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

  Future<void> onTap(BuildContext context) async {
    await Navigator.of(context).push(
      PageRouteBuilder<Widget>(
        opaque: false,
        barrierColor: Colors.black.withOpacity(.4),
        barrierDismissible: true,
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (context, animation, secondaryAnimation) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, .1),
            end: Offset.zero,
          ).animate(animation),
          child: Material(
            type: MaterialType.transparency,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: OfferCardWidget(
                    sponsoredOfferModel: sponsoredOfferModel,
                    offerModel: offerModel,
                    expiry: expiry,
                    amount: amount,
                    isExpanded: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
