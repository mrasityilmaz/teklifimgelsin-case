part of '../search_params_view.dart';

@immutable
final class _AmountSliderWidget extends ViewModelWidget<SearchParamsViewModel> {
  const _AmountSliderWidget();

  @override
  Widget build(BuildContext context, SearchParamsViewModel viewModel) {
    return SliderTheme(
      data: SliderThemeData(
        trackShape: CustomTrackShape(),
        trackHeight: 3,
        inactiveTrackColor: context.appColors.primaryGreyBorderColor.withOpacity(.5),
        activeTrackColor: context.appColors.primaryBlueAccentColor,
        thumbColor: context.appColors.primaryBlueAccentColor,
        thumbShape: CustomSliderThumbShape(
          borderColor: context.colors.background,
          elevation: 8,
          enabledThumbRadius: 7,
          thumbBorderWidth: 5,
        ),
      ),
      child: Padding(
        padding: context.paddingLowHorizontal * 1.2,
        child: Slider(
          value: viewModel.localSearchParams?.amount ?? viewModel.selectedLoanType.lowerAmountLimit,
          divisions: (viewModel.selectedLoanType.upperAmountLimit - viewModel.selectedLoanType.lowerAmountLimit).abs() ~/ (viewModel.selectedLoanType.stepAmount),
          min: viewModel.selectedLoanType.lowerAmountLimit,
          max: viewModel.selectedLoanType.upperAmountLimit,
          onChanged: viewModel.setAmountValue,
          onChangeEnd: (a) async => viewModel.fetchOffersWithNewParams(),
        ),
      ),
    );
  }
}
