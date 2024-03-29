part of '../home_view.dart';

@immutable
final class _HomeTitleButtonSection extends ViewModelWidget<HomeViewModel> {
  const _HomeTitleButtonSection() : super(reactive: false);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: context.colors.background,
      leadingWidth: 0,
      title: Row(
        children: [
          const Expanded(
            child: DateNowWidget(),
          ),
          SizedBox(width: context.screenPadding.left * .5),
          Expanded(
            child: AdvancedButtonWidget.iconText(
              icon: Icon(
                Icons.replay_rounded,
                color: context.appColors.primaryBlueColor,
              ),
              text: 'Tekrar Hesapla',
              textStyle: context.textTheme.bodySmall?.copyWith(
                color: context.appColors.primaryBlueColor,
                fontWeight: FontWeight.w800,
              ),
              onPressed: () => showSearchModalBottomSheet(
                context,
                onOfferResponsed: (offers) {
                  viewModel.setOfferList(offers);
                  viewModel.scrollController.animateTo(0, duration: const Duration(milliseconds: 400), curve: Curves.fastLinearToSlowEaseIn);
                },
              ),
              backgroundColor: context.appColors.primaryGreyBackgroundColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: context.appColors.primaryGreyBorderColor)),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showSearchModalBottomSheet(BuildContext context, {required ValueChanged<OffersResponseModel> onOfferResponsed}) async {
    final offers = await AppDialogs.instance.showModalBottomSheetDialog<OffersResponseModel?>(
      context,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: const SearchParamsView<OffersResponseModel?>(),
    );
    if (offers != null) {
      onOfferResponsed(offers);
    }
  }
}
