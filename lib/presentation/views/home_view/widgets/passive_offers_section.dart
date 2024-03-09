part of '../home_view.dart';

@immutable
final class _PassiveOffersSection extends ViewModelWidget<HomeViewModel> {
  const _PassiveOffersSection();

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    if (viewModel.offersResponse != null && viewModel.offersResponse?.passiveOffers?.isNotEmpty == true) {
      return SliverList.builder(
        itemCount: viewModel.offersResponse?.passiveOffers?.length ?? 0,
        itemBuilder: (context, index) {
          final offer = viewModel.offersResponse?.passiveOffers?[index];
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
