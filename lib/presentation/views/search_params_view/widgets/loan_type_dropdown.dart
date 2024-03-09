part of '../search_params_view.dart';

@immutable
final class _LoanTypeDropdownWidget extends ViewModelWidget<SearchParamsViewModel> {
  const _LoanTypeDropdownWidget();

  @override
  Widget build(BuildContext context, SearchParamsViewModel viewModel) {
    return CustomDropdown<LoanTypeEnum>(
      items: LoanTypeEnum.values,
      hintText: 'Kredi Türü',
      headerBuilder: (context, selectedItem) {
        return Text(
          selectedItem.text,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.appColors.primaryBlueAccentColor,
            fontWeight: FontWeight.w400,
          ),
        );
      },
      listItemBuilder: (context, item, isSelected, onItemSelect) => Padding(
        padding: context.paddingLowVertical * .3,
        child: Text(
          item.text,
          style: context.textTheme.titleSmall?.copyWith(
            color: context.appColors.primaryBlackTextColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      initialItem: viewModel.localSearchParams?.loanType,
      closedHeaderPadding: context.paddingLow * .8 + context.paddingLowVertical * .55,
      decoration: CustomDropdownDecoration(
        closedFillColor: context.appColors.primaryGreyBackgroundColor.withOpacity(.05),
        closedBorderRadius: BorderRadius.circular(12),
        closedBorder: Border.all(color: context.appColors.primaryGreyBorderColor),
        expandedBorder: Border.all(color: context.appColors.primaryGreyBorderColor),
        listItemDecoration: ListItemDecoration(
          selectedColor: context.appColors.primaryBlueAccentColor,
        ),
        headerStyle: context.textTheme.bodyMedium?.copyWith(
          color: context.appColors.primaryBlackTextColor,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: context.textTheme.bodyMedium?.copyWith(
          color: context.appColors.secondaryBlackTextColor,
          fontWeight: FontWeight.w400,
        ),
        listItemStyle: context.textTheme.titleSmall?.copyWith(
          color: context.appColors.primaryBlackTextColor,
          fontWeight: FontWeight.w400,
        ),
      ),
      onChanged: viewModel.setLoanType,
    );
  }
}
