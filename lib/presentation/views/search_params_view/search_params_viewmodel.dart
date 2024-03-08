import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_coding_setup/core/extensions/num_extension.dart';
import 'package:my_coding_setup/core/extensions/string_extension.dart';
import 'package:my_coding_setup/core/services/logger/logger_service.dart';
import 'package:my_coding_setup/data/models/search_params_model/search_params_model.dart';
import 'package:my_coding_setup/data/services/search_params_service.dart';
import 'package:my_coding_setup/injection/injection_container.dart';
import 'package:stacked/stacked.dart';

part 'mixins/search_params_mixin.dart';

final class SearchParamsViewModel extends ReactiveViewModel with _SearchParamsViewMixin {
  SearchParamsViewModel() {
    initMixin();

    localSearchParams = activeSearchParams;

    amountController.text = activeSearchParams.amount.formatToTRCurrencyWithoutAfterDecimal.withTLSymbol;
    monthController.text = '${activeSearchParams.expiry} Ay';
  }

  ///
  /// Dependencies
  ///
  final SearchParamsService _searchParamsService = locator<SearchParamsService>();

  SearchParamsService get _listenableSearchParamsService => listenableServices.first as SearchParamsService;

  ///
  /// Local variables
  ///

  ///
  /// Getters
  ///

  SearchParamsModel get activeSearchParams => _listenableSearchParamsService.activeSearchParams;

  List<SearchParamsModel> get lastSearchedParamList => _listenableSearchParamsService.lastSearchedParamList;

  ///
  /// Methods
  ///

  ///
  /// Update the search parameters which is stored in the service and notify the listeners
  ///
  /// !!! Use only with confirm button to update the search parameters
  ///
  Future<void> _updateSearchParams(SearchParamsModel searchParams) async {
    await _searchParamsService.updateSearchParams(searchParams);
  }

  ///
  /// Delete the search parameters from the list
  ///
  Future<void> deleteSearhParam(SearchParamsModel searchParams) async {
    await _searchParamsService.deleteSearchParams(searchParams);
  }

  Future<void> onPressedSearchButton() async {
    try {
      await _updateSearchParams(localSearchParams!);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<bool> fakeResponse() async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      debugPrint('${localSearchParams?.amount} - ${localSearchParams?.expiry} - ${localSearchParams?.loanType}');
      if (Random().nextBool()) {
        onChangedExpirySlider(24);
        setError('Hata oluştu lütfen tekrar deneyin');
        notifyListeners();
        return false;
      } else {
        setError(null);
        onChangedExpirySlider(32);
        return true;
      }
    });

    return true;
  }

  ////
  ///
  /// Define the listenable services for the view model to listen
  ///
  @override
  List<ListenableServiceMixin> get listenableServices => [_searchParamsService];

  @override
  void dispose() {
    mixinDispose();
    super.dispose();
  }
}
