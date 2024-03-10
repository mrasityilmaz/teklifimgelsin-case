part of '../home_view.dart';

@immutable
final class _PassiveOffersSection extends ViewModelWidget<HomeViewModel> {
  const _PassiveOffersSection();

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    if (viewModel.passiveOffers.isNotEmpty) {
      return SliverList.builder(
        itemCount: viewModel.passiveOffers.length,
        itemBuilder: (context, index) {
          final offer = viewModel.passiveOffers[index];
          return OfferCardWidget(
            offerModel: offer,
            isDisabled: true,
            expiry: viewModel.activeSearchParams.expiry,
            amount: viewModel.activeSearchParams.amount,
          );
        },
      );
    }

    return const SliverToBoxAdapter();
  }
}
