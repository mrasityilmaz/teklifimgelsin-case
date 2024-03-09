part of '../search_params_view.dart';

@immutable
final class _ConfirmButtonWidget extends ViewModelWidget<SearchParamsViewModel> {
  const _ConfirmButtonWidget();

  @override
  Widget build(BuildContext context, SearchParamsViewModel viewModel) {
    return Row(
      children: [
        Expanded(
          child: AdvancedButtonWidget.iconText(
            icon: AnimatedCrossFade(
              firstChild: const SizedBox(),
              secondChild: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator.adaptive(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(context.colors.background),
                  backgroundColor: context.colors.background,
                ),
              ),
              crossFadeState: viewModel.busy(viewModel.confirmButtonBusyIndicatorKey) ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200),
              reverseDuration: const Duration(milliseconds: 300),
              excludeBottomFocus: false,
            ),
            text: 'TeklifimGelsin',
            onPressed: viewModel.isBusy ? null : () async => viewModel.onPressedSearchButton(context),
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
