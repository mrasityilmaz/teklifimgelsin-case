part of '../search_params_view.dart';

@immutable
final class _ConfirmButtonWidget extends ViewModelWidget<SearchParamsViewModel> {
  const _ConfirmButtonWidget();

  @override
  Widget build(BuildContext context, SearchParamsViewModel viewModel) {
    return Row(
      children: [
        Expanded(
          child: AdvancedButtonWidget.text(
            text: 'TeklifimGelsin',
            onPressed: viewModel.onPressedSearchButton,
            padding: context.paddingLowVertical * 1.2,
            textStyle: context.textTheme.bodyLarge?.copyWith(
              color: context.colors.background,
              fontWeight: FontWeight.w700,
            ),
            backgroundColor: context.appColors.primaryBlueAccentColor,
          ),
        ),
      ],
    );
  }
}
