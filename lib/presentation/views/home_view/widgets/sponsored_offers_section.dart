part of '../home_view.dart';

@immutable
final class _SponsoredOffersSection extends ViewModelWidget<HomeViewModel> {
  const _SponsoredOffersSection();

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    if (viewModel.sponsoredOffers.isNotEmpty) {
      return SliverList.builder(
        itemCount: viewModel.sponsoredOffers.length,
        itemBuilder: (context, index) {
          final offer = viewModel.sponsoredOffers[index];
          return OfferCardWidget(
            sponsoredOfferModel: offer,
            expiry: viewModel.activeSearchParams.expiry,
            amount: viewModel.activeSearchParams.amount,
          );
        },
      );
    }

    return const SliverToBoxAdapter();
  }
}
