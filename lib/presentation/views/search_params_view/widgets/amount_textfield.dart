part of '../search_params_view.dart';

@immutable
final class _AmountTextFieldWidget extends ViewModelWidget<SearchParamsViewModel> {
  const _AmountTextFieldWidget();

  @override
  Widget build(BuildContext context, SearchParamsViewModel viewModel) {
    return CustomTextFieldWidget(
      controller: viewModel.amountController,
      hintText: '',
      textCapitalization: TextCapitalization.characters,
      textInputType: TextInputType.number,
      textInputAction: TextInputAction.done,
      fillColor: context.appColors.primaryGreyBackgroundColor.withOpacity(.05),
      textStyle: context.textTheme.titleLarge?.copyWith(
        color: context.appColors.primaryBlackTextColor,
        fontWeight: FontWeight.w400,
      ),
      onTap: viewModel.tryToCloseExpansionTile,
      inputFormatter: [CustomAmountFormatter()],
      suffixIcon: Container(
        padding: context.paddingLowVertical * .5 + context.paddingLowHorizontal,
        margin: EdgeInsets.only(right: (context.paddingLowHorizontal * .8).right),
        decoration: BoxDecoration(
          color: context.appColors.primaryBlueAccentColor.withOpacity(.15),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: context.appColors.primaryGreyBackgroundColor, width: .7),
        ),
        child: Text(
          'Tutar',
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.appColors.primaryBlueAccentColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
