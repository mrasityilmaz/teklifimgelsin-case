part of '../../offer_card_component.dart';

@immutable
final class __DetailRows extends StatelessWidget {
  __DetailRows({required this.expiry, required this.amount, this.offerModel, this.isExpanded = false}) {
    loanDetailModel = OfferLoanDetailModel.fromLoanDetail(interestRate: offerModel?.interestRate, mount: expiry, amountValue: amount, annualRate: offerModel?.annualRate);
  }

  late final OfferLoanDetailModel loanDetailModel;
  final OfferModel? offerModel;
  final bool isExpanded;
  final int expiry;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormalVertical * .5,
      child: Column(
        children: [
          ///
          /// Top Detail - Monthly Payment, Interest Rate, Total Cost
          ///
          Row(
            children: [
              Expanded(
                child: __OfferCardCenterDetailWidget(
                  title: monthlyText,
                  subTitle: monthlyLoanPaymentValueText,
                ),
              ),
              Expanded(
                child: __OfferCardCenterDetailWidget(
                  title: interestRateText,
                  subTitle: monthlyInterestRateValueText,
                  icon: interestRateIcon(context),
                  onPressedIcon: interestRateOnPressed(),
                ),
              ),
              Expanded(
                child: __OfferCardCenterDetailWidget(
                  title: totalCostText,
                  subTitle: totalLoanCostValueText,
                ),
              ),
            ],
          ),

          if (isExpanded) ...[
            Column(
              children: [
                ///
                /// Center Detail - Total Payment, Annual Rate, Expense
                ///
                Padding(
                  padding: context.paddingNormalVertical,
                  child: Row(
                    children: [
                      Expanded(
                        child: __OfferCardCenterDetailWidget(
                          title: totalPaymentText,
                          subTitle: totalLoanPaymentValueText,
                        ),
                      ),
                      Expanded(
                        child: __OfferCardCenterDetailWidget(
                          title: annualRateText,
                          subTitle: annualRateValueText,
                        ),
                      ),
                      Expanded(
                        child: __OfferCardCenterDetailWidget(
                          title: expenseText,
                          subTitle: expenseValueText,
                        ),
                      ),
                    ],
                  ),
                ),

                ///
                /// Bottom Detail - Total Offer, Expiry
                ///
                Row(
                  children: [
                    Expanded(
                      child: __OfferCardCenterDetailWidget(
                        title: totalOfferText,
                        subTitle: totalOfferValueText,
                      ),
                    ),
                    Expanded(
                      child: __OfferCardCenterDetailWidget(
                        title: expiryText,
                        subTitle: expiryValueText,
                      ),
                    ),
                  ],
                ),

                Divider(
                  color: context.appColors.secondaryBlackTextColor.withOpacity(.65),
                  height: context.lowValue * 1.5,
                  thickness: 1,
                ),

                ///
                /// Payment Plan
                ///
                _DetailPlanTable(loanDetailModel),
              ],
            ),
          ],
        ],
      ),
    );
  }

  String get monthlyText => 'Taksit';

  String get monthlyLoanPaymentValueText => loanDetailModel.monthlyLoanPayment.formatToTRCurrency.withTLSymbol;

  String get interestRateText => 'Oran';
  String get monthlyInterestRateValueText => loanDetailModel.interestRate.formatToTRCurrency.withPercentSymbol;

  String get totalCostText => 'Toplam Maliyet';
  String get totalLoanCostValueText => (loanDetailModel.totalLoanPayment + loanDetailModel.processCost).formatToTRCurrency.withTLSymbol;

  String get totalPaymentText => 'Toplam Ödeme';
  String get totalLoanPaymentValueText => loanDetailModel.totalLoanPayment.formatToTRCurrency.withTLSymbol;

  String get annualRateText => 'Yıllık Oran';
  String get annualRateValueText => loanDetailModel.annualRate.formatToTRCurrency.withPercentSymbol;

  String get expenseText => 'Masraf';
  String get expenseValueText => loanDetailModel.processCost.formatToTRCurrency.withTLSymbol;

  String get totalOfferText => 'Tutar';
  String get totalOfferValueText => loanDetailModel.totalOfferValue.formatToTRCurrency.withTLSymbol;

  String get expiryText => 'Vade';
  String get expiryValueText => loanDetailModel.expiry.toString();

  Icon interestRateIcon(BuildContext context) => Icon(
        Icons.info_outline_rounded,
        color: context.appColors.primaryBlueColor,
        size: 18,
      );

  VoidCallback? interestRateOnPressed() => () => debugPrint('Interest Rate Info');
}

///
/// Detail Plan Table
///
@immutable
final class _DetailPlanTable extends StatelessWidget {
  const _DetailPlanTable(this.loanDetailModel);
  final OfferLoanDetailModel loanDetailModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Detaylı Kredi Tablosu',
          style: context.textTheme.titleSmall?.copyWith(
            color: context.appColors.primaryBlackTextColor,
          ),
        ),
        SizedBox(
          height: context.normalValue,
        ),
        SingleChildScrollView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          physics: const ClampingScrollPhysics(),
          child: Table(
            columnWidths: const <int, TableColumnWidth>{
              0: IntrinsicColumnWidth(),
              1: IntrinsicColumnWidth(),
              2: IntrinsicColumnWidth(),
              3: IntrinsicColumnWidth(),
              4: IntrinsicColumnWidth(),
              5: IntrinsicColumnWidth(),
              6: IntrinsicColumnWidth(),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              ...[
                TableRow(
                  decoration: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: context.appColors.primaryGreyBorderColor,
                      width: .5,
                    ),
                  ),
                  children: ['Ay', 'Taksit', 'Ana Para', 'Faiz', 'KKDF', 'BSMV', 'Kalan Ana Para']
                      .map(
                        (e) => Padding(
                          padding: context.paddingLow,
                          child: Text(
                            e,
                            textAlign: TextAlign.center,
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: context.appColors.primaryBlackTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
              ...loanDetailModel.detailedPaymentPlanList.map((e) {
                return TableRow(
                  decoration: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: context.appColors.primaryGreyBorderColor,
                      width: .5,
                    ),
                  ),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: context.appColors.primaryBlueAccentColor,
                        shape: BoxShape.circle,
                      ),
                      padding: context.paddingLow * .4,
                      child: Center(
                        child: Text(
                          e.monthIndex.toString(),
                          style: context.textTheme.bodyMedium?.copyWith(color: context.appColors.primaryWhiteBackgroundColor, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Padding(
                      padding: context.paddingLow * 1.5,
                      child: Text(
                        e.monthlyPayment.formatToTRCurrency.withTLSymbol,
                        style: context.textTheme.bodyMedium?.copyWith(color: context.appColors.primaryBlackTextColor),
                      ),
                    ),
                    Padding(
                      padding: context.paddingLow,
                      child: Text(
                        e.anaPara.formatToTRCurrency.withTLSymbol,
                        style: context.textTheme.bodyMedium?.copyWith(color: context.appColors.primaryBlackTextColor),
                      ),
                    ),
                    Padding(
                      padding: context.paddingLow,
                      child: Text(
                        e.interest.formatToTRCurrency.withTLSymbol,
                        style: context.textTheme.bodyMedium?.copyWith(color: context.appColors.primaryBlackTextColor),
                      ),
                    ),
                    Padding(
                      padding: context.paddingLow,
                      child: Text(
                        e.kkdf.formatToTRCurrency.withTLSymbol,
                        style: context.textTheme.bodyMedium?.copyWith(color: context.appColors.primaryBlackTextColor),
                      ),
                    ),
                    Padding(
                      padding: context.paddingLow,
                      child: Text(
                        e.bsmv.formatToTRCurrency.withTLSymbol,
                        style: context.textTheme.bodyMedium?.copyWith(color: context.appColors.primaryBlackTextColor),
                      ),
                    ),
                    Padding(
                      padding: context.paddingLow,
                      child: Text(
                        e.kalanAnaPara.formatToTRCurrency.withTLSymbol,
                        style: context.textTheme.bodyMedium?.copyWith(color: context.appColors.primaryBlackTextColor),
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
