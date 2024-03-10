part of '../home_view.dart';

@immutable
final class _ActiveOffersSection extends ViewModelWidget<HomeViewModel> {
  const _ActiveOffersSection();

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    if (viewModel.activeOffers.isNotEmpty) {
      return SliverList.builder(
        itemCount: viewModel.activeOffers.length,
        itemBuilder: (context, index) {
          final offer = viewModel.activeOffers[index];
          return OfferCardWidget(
            offerModel: offer,
            expiry: viewModel.activeSearchParams.expiry,
            amount: viewModel.activeSearchParams.amount,
          );
        },
      );
    }

    return const SliverToBoxAdapter();
  }
}
