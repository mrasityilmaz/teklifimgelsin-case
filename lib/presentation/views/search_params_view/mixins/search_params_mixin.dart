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
    amountController = TextEditingController(text: '1.000'.withTLSymbol)..addListener(onChangedAmountText);
    monthController = TextEditingController(text: '1 Ay')..addListener(onChangedExpiryText);
    expansionTileController = ExpansionTileController();
  }

  void onChangedAmountText() {
    try {
      final double? amount = amountController.text.toDoubleOrNull;
      if (amount == null) {
        return;
      } else {
        if (amount != localSearchParams?.amount && amount >= 1000 && amount <= 300000) {
          localSearchParams = localSearchParams?.copyWith(
            amount: amount,
          );

          tryToCloseExpansionTile();
          notifyListeners();
        }
      }
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  void onChangedExpiryText() {
    try {
      final int? month = monthController.text.toIntOrNull;
      if (month == null) {
        return;
      } else {
        if (month >= 1 && month <= 36 && month != localSearchParams?.expiry) {
          localSearchParams = localSearchParams?.copyWith(
            expiry: month,
          );

          tryToCloseExpansionTile();
          notifyListeners();
        }
      }
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  void onChangedAmountSlider(double value) {
    try {
      if (value >= 1000 && value <= 300000) {
        localSearchParams = localSearchParams?.copyWith(
          amount: value,
        );

        amountController.text = value.formatToTRCurrencyWithoutAfterDecimal.withTLSymbol;
        tryToCloseExpansionTile();
        notifyListeners();
      }
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  void onChangedExpirySlider(double value) {
    try {
      if (value >= 1 && value <= 36) {
        localSearchParams = localSearchParams?.copyWith(
          expiry: value.toInt(),
        );

        monthController.text = '${value.toInt()} Ay';
        tryToCloseExpansionTile();
        notifyListeners();
      }
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  void tryToCloseExpansionTile() {
    try {
      if (expansionTileController.isExpanded) {
        expansionTileController.collapse();
      }
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  void updateLocalSearchParams(SearchParamsModel searchParamsValue) {
    try {
      onChangedAmountSlider(searchParamsValue.amount);
      onChangedExpirySlider(searchParamsValue.expiry.toDouble());
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
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
}
