part of '../home_view.dart';

final class _HomeSearchTitleWidget extends ViewModelWidget<HomeViewModel> {
  const _HomeSearchTitleWidget();

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final int mount = viewModel.activeSearchParams.expiry;
    final double amountByK = viewModel.activeSearchParams.amount / 1000;
    final int count = viewModel.offersResponse?.activeOffers?.length ?? 0;
    final String loanType = viewModel.activeSearchParams.loanType.name;
    return Padding(
      padding: context.screenPaddingHorizontal + context.paddingNormalVertical,
      child: Text(
        '''$mount Ay Vadeli ${amountByK.toStringAsFixed(3)} TL $loanType Kredisi için aylık taksite göre sıralanmış $count teklifin var.''',
        textAlign: TextAlign.center,
        maxLines: 3,
        style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700, fontSize: 18, color: context.appColors.primaryBlueColor),
      ),
    );
  }
}
