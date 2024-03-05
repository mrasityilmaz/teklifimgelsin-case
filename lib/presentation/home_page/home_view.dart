import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_coding_setup/assets.dart';
import 'package:my_coding_setup/core/extensions/context_extension.dart';
import 'package:my_coding_setup/core/extensions/sliver_extension.dart';
import 'package:my_coding_setup/presentation/core_widgets/ad_banner_widget/ad_banner_widget.dart';
import 'package:my_coding_setup/presentation/core_widgets/date_now_widget/date_now_widget.dart';

part 'widgets/app_bar.dart';
part 'widgets/search_title.dart';

final class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            const HomeAppBarWidget(),
            const AdBannerWidget(
              imageUrl: 'https://cdn.teklifimgelsin.com/images/banners/QNB_30k_720x250.webp',
            ).wrapInSliverToBoxAdapter(),
            const HomeSearchTitleWidget(
              amountByK: 52,
              count: 24,
              loanType: 'İhtiyaç',
              mount: 36,
            ).wrapInSliverToBoxAdapter(),
            SliverToBoxAdapter(
              child: Padding(
                padding: context.screenPaddingHorizontal,
                child: Row(
                  children: [
                    const Expanded(
                      child: DateNowWidget(),
                    ),
                    SizedBox(width: context.screenPadding.left * .5),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: context.paddingLowVertical * .7,
                          elevation: 0,
                          backgroundColor: context.appColors.primaryGreyBackgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: context.appColors.primaryGreyBorderColor),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.replay_rounded,
                              color: context.appColors.primaryBlueColor,
                            ),
                            SizedBox(width: context.lowValue),
                            Text(
                              'Tekrar Hesapla',
                              style: context.textTheme.bodySmall?.copyWith(
                                color: context.appColors.primaryBlueColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.amber,
                height: 800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
