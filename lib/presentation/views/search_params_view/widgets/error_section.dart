part of '../search_params_view.dart';

@immutable
final class _ErrorSection extends ViewModelWidget<SearchParamsViewModel> {
  const _ErrorSection();

  @override
  Widget build(BuildContext context, SearchParamsViewModel viewModel) {
    return AnimatedCrossFade(
      firstChild: const SizedBox(),
      secondChild: Container(
        padding: context.paddingLow,
        margin: context.paddingNormalBottom * 2,
        decoration: BoxDecoration(
          border: Border.all(
            color: context.appColors.primaryBlueAccentColor.withOpacity(.7),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              Icons.error_outline_rounded,
              color: context.appColors.primaryBlueAccentColor.withOpacity(.7),
            ),
            SizedBox(
              width: context.lowValue,
            ),
            Expanded(
              child: Text(
                viewModel.error(viewModel.limitErrorKey) != null ? (viewModel.error(viewModel.limitErrorKey) as OfferLimitFailure).errorMessage : '',
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 12.5,
                  color: context.appColors.primaryBlackTextColor.withOpacity(.8),
                ),
              ),
            ),
          ],
        ),
      ),
      crossFadeState: viewModel.hasErrorForKey(viewModel.limitErrorKey) ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 200),
      alignment: Alignment.center,
      excludeBottomFocus: false,
      reverseDuration: const Duration(milliseconds: 200),
      sizeCurve: Curves.bounceInOut,
    );
  }
}
