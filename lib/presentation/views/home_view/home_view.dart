import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teklifimgelsin_case/assets.dart';
import 'package:teklifimgelsin_case/core/extensions/context_extension.dart';
import 'package:teklifimgelsin_case/core/extensions/num_extension.dart';
import 'package:teklifimgelsin_case/core/extensions/sliver_extension.dart';
import 'package:teklifimgelsin_case/core/extensions/string_extension.dart';
import 'package:teklifimgelsin_case/data/models/offer_response_model/offers_response_model.dart';
import 'package:teklifimgelsin_case/presentation/core_widgets/ad_banner_widget/ad_banner_widget.dart';
import 'package:teklifimgelsin_case/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:teklifimgelsin_case/presentation/core_widgets/date_now_widget/date_now_widget.dart';
import 'package:teklifimgelsin_case/presentation/core_widgets/offer_card_component/offer_card_component.dart';
import 'package:teklifimgelsin_case/presentation/dialogs/app_dialogs.dart';
import 'package:teklifimgelsin_case/presentation/views/home_view/home_viewmodel.dart';
import 'package:teklifimgelsin_case/presentation/views/search_params_view/search_params_view.dart';
import 'package:stacked/stacked.dart';

part 'widgets/active_offers_section.dart';
part 'widgets/app_bar.dart';
part 'widgets/passive_offers_section.dart';
part 'widgets/search_title.dart';
part 'widgets/sponsored_offers_section.dart';
part 'widgets/title_buttons_section.dart';

final class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: HomeViewModel.new,
      onViewModelReady: (viewModel) async {
        await viewModel.getOffers();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: CustomScrollView(
              shrinkWrap: true,
              controller: viewModel.scrollController,
              slivers: [
                const _HomeAppBarWidget(),
                const AdBannerWidget(
                  imageUrl: 'https://cdn.teklifimgelsin.com/images/banners/QNB_30k_720x250.webp',
                ).wrapInSliverToBoxAdapter,
                const _HomeSearchTitleWidget().wrapInSliverToBoxAdapter,
                const _HomeTitleButtonSection(),
                SizedBox(
                  height: context.normalValue,
                ).wrapInSliverToBoxAdapter,
                const _SponsoredOffersSection(),
                AdBannerWidget(
                  imageUrl: 'https://cdn.teklifimgelsin.com/images/banners/QNB_30k_720x250.webp',
                  borderRadius: BorderRadius.circular(12),
                  padding: context.screenPaddingHorizontal + context.paddingNormalBottom,
                  border: Border.all(color: context.appColors.primaryGreyBorderColor, width: 1.5),
                ).wrapInSliverToBoxAdapter,
                const _ActiveOffersSection(),
                const _PassiveOffersSection(),
                SliverSafeArea(
                  minimum: context.adaptiveScreenPaddingBottom + context.paddingMediumBottom,
                  sliver: const SliverToBoxAdapter(
                    child: SizedBox(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
