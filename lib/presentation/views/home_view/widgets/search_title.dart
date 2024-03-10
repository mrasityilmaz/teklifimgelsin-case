part of '../home_view.dart';

final class _HomeSearchTitleWidget extends ViewModelWidget<HomeViewModel> {
  const _HomeSearchTitleWidget();

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final int mount = viewModel.activeSearchParams.expiry;
    final String amountByK = viewModel.activeSearchParams.amount.formatToTRCurrencyWithoutAfterDecimal.withTLSymbol;
    final int count = viewModel.offersResponse?.activeOffers?.length ?? 0;
    final String loanType = viewModel.activeSearchParams.loanType.text;
    return Padding(
      padding: context.screenPaddingHorizontal + context.paddingNormalVertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                'Kredi Tipi:\t',
                style: context.textTheme.titleMedium,
              ),
              Text(
                loanType,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Kredi Tutarı:\t',
                style: context.textTheme.titleMedium,
              ),
              Text(
                amountByK,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Vade:\t',
                style: context.textTheme.titleMedium,
              ),
              Text(
                '$mount Ay',
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: context.lowValue,
          ),
          Text(
            'Toplam $count adet kredi bulundu.',
            style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
