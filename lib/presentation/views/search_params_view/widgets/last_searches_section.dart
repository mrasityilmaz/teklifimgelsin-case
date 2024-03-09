part of '../search_params_view.dart';

@immutable
final class _LastSearchesSection extends ViewModelWidget<SearchParamsViewModel> {
  const _LastSearchesSection();

  @override
  Widget build(BuildContext context, SearchParamsViewModel viewModel) {
    if (viewModel.lastSearchedParamList.isEmpty) {
      return const SizedBox();
    }
    return Padding(
      padding: context.paddingLowVertical,
      child: ExpansionTile(
        title: Text('Geçmiş Aramalar', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400, color: context.appColors.secondaryBlackTextColor)),
        childrenPadding: EdgeInsets.zero,
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tilePadding: context.screenPaddingHorizontal * .5,
        controller: viewModel.expansionTileController,
        children: [
          LimitedBox(
            maxHeight: context.height * .25,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: viewModel.lastSearchedParamList.length,
              itemBuilder: (context, index) {
                final e = viewModel.lastSearchedParamList.reversed.toList()[index];
                return ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  leading: Icon(
                    Icons.replay,
                    size: 15,
                    color: context.appColors.secondaryBlackTextColor,
                  ),
                  minLeadingWidth: 15,
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline_rounded, color: Colors.red.withOpacity(.5)),
                    onPressed: () async => viewModel.deleteSearhParam(e),
                  ),
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            e.amount.formatToTRCurrencyWithoutAfterDecimal.withTLSymbol,
                            style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400, color: context.appColors.secondaryBlackTextColor),
                          ),
                          SizedBox(width: context.normalValue),
                          Text('${e.expiry} Ay', style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400, color: context.appColors.secondaryBlackTextColor)),
                        ],
                      ),
                      Text(
                        e.loanType.text,
                        style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400, color: context.appColors.secondaryBlackTextColor),
                      ),
                    ],
                  ),
                  onTap: () async {
                    viewModel.updateLocalSearchParams(e);
                    await viewModel.fetchOffersWithNewParams();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
