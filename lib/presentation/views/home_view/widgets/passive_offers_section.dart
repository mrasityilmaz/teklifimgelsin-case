part of '../home_view.dart';

@immutable
final class _PassiveOffersSection extends ViewModelWidget<HomeViewModel> {
  const _PassiveOffersSection();

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    if (viewModel.offersResponse != null && viewModel.offersResponse?.passiveOffers?.isNotEmpty == true) {
      return SliverOpacity(
        opacity: .3,
        sliver: SliverList.builder(
          itemCount: viewModel.offersResponse?.passiveOffers?.length ?? 0,
          itemBuilder: (context, index) {
            final offer = viewModel.offersResponse?.passiveOffers?[index];
            return OfferCardWidget(
              offerModel: offer,
              expiry: 12,
              amount: 1000,
            );
          },
        ),
      );
    }

    return const SliverToBoxAdapter();
  }
}
