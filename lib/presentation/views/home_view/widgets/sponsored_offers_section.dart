part of '../home_view.dart';

@immutable
final class _SponsoredOffersSection extends ViewModelWidget<HomeViewModel> {
  const _SponsoredOffersSection();

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    if (viewModel.offersResponse != null && viewModel.offersResponse?.sponsoredOffers?.isNotEmpty == true) {
      return SliverList.builder(
        itemCount: viewModel.offersResponse?.sponsoredOffers?.length ?? 0,
        itemBuilder: (context, index) {
          final offer = viewModel.offersResponse?.sponsoredOffers?[index];
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
