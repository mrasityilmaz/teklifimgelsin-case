part of '../search_params_view.dart';

@immutable
final class _ExpiryTextFieldWidget extends ViewModelWidget<SearchParamsViewModel> {
  const _ExpiryTextFieldWidget();

  @override
  Widget build(BuildContext context, SearchParamsViewModel viewModel) {
    return CustomTextFieldWidget(
      maxLength: 5,
      controller: viewModel.monthController,
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
      onChanged: (s) async {
        // Yalnızca rakamları korumak için regex kullanma
        final RegExp regex = RegExp('[0-9]');

        // Yeni girilen metinde yalnızca rakamları koruma
        final String newText = regex.allMatches(s).map((match) => match.group(0)).join();
        if (newText.isNotEmpty && newText != '0') {
          await viewModel.fetchOffersWithNewParams();
        }
      },
      onTapOutside: () => viewModel.checkValidAllTextFields(),
      inputFormatter: [CustomMonthFormatter(maxMonth: viewModel.localSearchParams!.loanType.upperExpiryLimit)],
      suffixIcon: Container(
        padding: context.paddingLowVertical * .5 + context.paddingLowHorizontal,
        margin: EdgeInsets.only(right: (context.paddingLowHorizontal * .8).right),
        decoration: BoxDecoration(
          color: context.appColors.primaryBlueAccentColor.withOpacity(.15),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: context.appColors.primaryGreyBackgroundColor, width: .7),
        ),
        child: Text(
          'Vade',
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.appColors.primaryBlueAccentColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
