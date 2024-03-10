part of '../search_params_viewmodel.dart';

mixin _SearchParamsViewMixin on ReactiveViewModel {
  late final TextEditingController amountController;
  late final TextEditingController monthController;
  late final ExpansionTileController expansionTileController;

  late SearchParamsModel? localSearchParams;

  ///
  /// Initialize the mixin variables
  ///
  void initMixin() {
    amountController = TextEditingController(text: '1.000'.withTLSymbol)
      ..addListener(() {
        final double? amount = amountController.text.toDoubleOrNull;
        if (amount == null) {
          return;
        } else {
          setAmountValue(amount);
        }
      });

    ///
    ///
    ///
    monthController = TextEditingController(text: '1 Ay')
      ..addListener(() {
        final int? month = monthController.text.toIntOrNull;
        if (month == null) {
          return;
        } else {
          setExpiryValue(month.toDouble());
        }
      });

    ///
    ///
    ///
    expansionTileController = ExpansionTileController();
  }

  double? get amountFromTextController => amountController.text.toDoubleOrNull;

  double? get expiryFromTextController => monthController.text.toDoubleOrNull;

  ///
  ///
  ///

  void updateLocalSearchParams(SearchParamsModel searchParamsValue) {
    try {
      localSearchParams = searchParamsValue;
      setAmountValue(searchParamsValue.amount);
      setExpiryValue(searchParamsValue.expiry.toDouble());
      tryToCloseExpansionTile();
      notifyListeners();
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  void setAmountValue(double value) {
    try {
      if (isAmountValid(value)) {
        if (value != amountFromTextController) {
          amountController.text = value.formatToTRCurrencyWithoutAfterDecimal.withTLSymbol;
        }
        if (value != localSearchParams?.amount) {
          updateLocalSearchParams(
            localSearchParams!.copyWith(
              amount: value,
            ),
          );
        }
      }
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  void setExpiryValue(double value) {
    try {
      if (isExpiryValid(value)) {
        if (value != expiryFromTextController) {
          monthController.text = '${value.toInt()} Ay';
        }
        if (value != localSearchParams?.expiry) {
          updateLocalSearchParams(
            localSearchParams!.copyWith(
              expiry: value.toInt(),
            ),
          );
        }
      }
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  void setLoanType(LoanTypeEnum value) {
    clearErrors();
    updateLocalSearchParams(
      localSearchParams!.copyWith(
        loanType: value,
        amount: value.lowerAmountLimit,
        expiry: value.lowerExpiryLimit,
      ),
    );
  }

  void tryToCloseExpansionTile() {
    try {
      if (expansionTileController.isExpanded) {
        expansionTileController.collapse();
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  void checkValidAllTextFields() {
    if (localSearchParams == null) {
      return;
    }

    setAmountValue(localSearchParams!.amount);
    setExpiryValue(localSearchParams!.expiry.toDouble());
  }

  ///
  /// Dispose the mixin variables
  ///

  void mixinDispose() {
    amountController
      ..removeListener(() {})
      ..dispose();
    monthController
      ..removeListener(() {})
      ..dispose();
  }

  LoanTypeEnum get selectedLoanType => localSearchParams?.loanType ?? LoanTypeEnum.personalFinanceLoan;

  bool isAmountValid(double value) => selectedLoanType.lowerAmountLimit <= value && value <= selectedLoanType.upperAmountLimit;

  bool isExpiryValid(double value) => selectedLoanType.lowerExpiryLimit <= value && value <= selectedLoanType.upperExpiryLimit;
}
