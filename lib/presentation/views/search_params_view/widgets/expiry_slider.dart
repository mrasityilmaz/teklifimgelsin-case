part of '../search_params_view.dart';

@immutable
final class _ExpirySliderWidget extends ViewModelWidget<SearchParamsViewModel> {
  const _ExpirySliderWidget();

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
          value: viewModel.localSearchParams?.expiry.toDouble() ?? viewModel.selectedLoanType.lowerExpiryLimit.toDouble(),
          divisions: viewModel.selectedLoanType.upperExpiryLimit - 1,
          min: viewModel.selectedLoanType.lowerExpiryLimit.toDouble(),
          max: viewModel.selectedLoanType.upperExpiryLimit.toDouble(),
          onChanged: viewModel.setExpiryValue,
          onChangeEnd: (a) async => viewModel.fetchOffersWithNewParams(),
        ),
      ),
    );
  }
}
