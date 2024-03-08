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
        padding: context.paddingLowHorizontal * .5,
        child: Slider(
          value: viewModel.localSearchParams?.amount ?? 1000,
          divisions: (300000 - 1000) ~/ 1000,
          min: 1000,
          max: 300000,
          onChanged: viewModel.onChangedAmountSlider,
          onChangeEnd: (a) async => viewModel.fakeResponse(),
        ),
      ),
    );
  }
}
