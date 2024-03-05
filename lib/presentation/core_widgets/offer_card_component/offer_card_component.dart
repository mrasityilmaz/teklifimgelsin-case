import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_coding_setup/core/extensions/context_extension.dart';
import 'package:my_coding_setup/data/models/sponsored_offer_model/sponsored_offer_model.dart';
import 'package:my_coding_setup/presentation/core_widgets/advanced_button/advanced_button_widget.dart';

part 'widgets/badge_text_widget.dart';
part 'widgets/bank_detail_section.dart';
part 'widgets/bottom_buttons_section.dart';
part 'widgets/center_detail_widget.dart';

final class OfferCardWidget extends StatelessWidget {
  const OfferCardWidget({super.key, this.sponsoredOfferModel});
  final SponsoredOfferModel? sponsoredOfferModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.screenPaddingHorizontal + context.paddingNormalBottom + _ifBadgeTextExist(context),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: context.colors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.appColors.primaryBlueAccentColor, width: 1.5),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Padding(
            padding: context.paddingLowHorizontal + context.paddingLowBottom * .5 + context.paddingLowTop * 1.2,
            child: Column(
              children: [
                ///
                /// Bank Detail - Bank Logo, Ad, Share
                ///
                _BankDetailSection(
                  bankId: sponsoredOfferModel?.bankId,
                ),

                ///
                /// Center Detail - Title, Amount, Term, Interest
                ///
                const _LoanDetailRowSection(),

                ///
                /// Bottom Buttons - Apply, Details
                ///
                const _BottomButtonsSection(),
              ],
            ),
          ),
          if (sponsoredOfferModel?.badgeText?.isNotEmpty == true) ...[
            Positioned(
              top: -kMinInteractiveDimension * .65 * .5,
              child: _BadgeTextWidget(text: sponsoredOfferModel?.badgeText ?? ''),
            ),
          ],
        ],
      ),
    );
  }

  EdgeInsets _ifBadgeTextExist(BuildContext context) => ((sponsoredOfferModel?.badgeText?.isNotEmpty == true) ? context.paddingNormalTop * .5 : EdgeInsets.zero);
}
