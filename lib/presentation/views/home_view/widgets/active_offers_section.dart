part of '../home_view.dart';

@immutable
final class _ActiveOffersSection extends ViewModelWidget<HomeViewModel> {
  const _ActiveOffersSection();

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    if (viewModel.offersResponse != null && viewModel.offersResponse?.activeOffers?.isNotEmpty == true) {
      return SliverList.builder(
        itemCount: viewModel.offersResponse?.activeOffers?.length ?? 0,
        itemBuilder: (context, index) {
          final offer = viewModel.offersResponse?.activeOffers?[index];
          return OfferCardWidget(
            offerModel: offer,
            expiry: 12,
            amount: 60000,
          );
        },
      );
    }

    return const SliverToBoxAdapter();
  }
}
