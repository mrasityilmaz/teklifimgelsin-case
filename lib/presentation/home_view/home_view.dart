import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_coding_setup/assets.dart';
import 'package:my_coding_setup/core/extensions/context_extension.dart';
import 'package:my_coding_setup/core/extensions/sliver_extension.dart';
import 'package:my_coding_setup/presentation/core_widgets/ad_banner_widget/ad_banner_widget.dart';
import 'package:my_coding_setup/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:my_coding_setup/presentation/core_widgets/date_now_widget/date_now_widget.dart';
import 'package:my_coding_setup/presentation/core_widgets/offer_card_component/offer_card_component.dart';
import 'package:my_coding_setup/presentation/home_view/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

part 'widgets/app_bar.dart';
part 'widgets/search_title.dart';
part 'widgets/title_buttons_section.dart';

final class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: HomeViewModel.new,
      onViewModelReady: (viewModel) async {
        await viewModel.getOffers();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: CustomScrollView(
              slivers: [
                const _HomeAppBarWidget(),
                const AdBannerWidget(
                  imageUrl: 'https://cdn.teklifimgelsin.com/images/banners/QNB_30k_720x250.webp',
                ).wrapInSliverToBoxAdapter,
                const _HomeSearchTitleWidget(
                  amountByK: 52,
                  count: 24,
                  loanType: 'İhtiyaç',
                  mount: 36,
                ).wrapInSliverToBoxAdapter,
                const _HomeTitleButtonSection().wrapInSliverToBoxAdapter,
                SizedBox(
                  height: context.normalValue,
                ).wrapInSliverToBoxAdapter,
                if (viewModel.offersResponse != null && viewModel.offersResponse?.sponsoredOffers?.isNotEmpty == true) ...[
                  SliverList.builder(
                    itemCount: viewModel.offersResponse?.sponsoredOffers?.length ?? 0,
                    itemBuilder: (context, index) {
                      final offer = viewModel.offersResponse?.sponsoredOffers?[index];
                      return OfferCardWidget(
                        sponsoredOfferModel: offer,
                      );
                    },
                  ),
                ],
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
