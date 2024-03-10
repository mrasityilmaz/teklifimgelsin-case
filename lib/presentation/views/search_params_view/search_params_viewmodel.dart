import 'package:darq/darq.dart';
import 'package:flutter/material.dart';
import 'package:teklifimgelsin_case/core/errors/errors.dart';
import 'package:teklifimgelsin_case/core/extensions/failure_extension.dart';
import 'package:teklifimgelsin_case/core/extensions/list_extension.dart';
import 'package:teklifimgelsin_case/core/extensions/num_extension.dart';
import 'package:teklifimgelsin_case/core/extensions/string_extension.dart';
import 'package:teklifimgelsin_case/core/services/logger/logger_service.dart';
import 'package:teklifimgelsin_case/data/enums/credit_type_enum.dart';
import 'package:teklifimgelsin_case/data/models/offer_response_model/offers_response_model.dart';
import 'package:teklifimgelsin_case/data/models/search_params_model/search_params_model.dart';
import 'package:teklifimgelsin_case/data/services/search_params_service.dart';
import 'package:teklifimgelsin_case/domain/repositories/offer_repository/i_offer_repository.dart';
import 'package:teklifimgelsin_case/injection/injection_container.dart';
import 'package:stacked/stacked.dart';

part 'mixins/search_offer_mixin.dart';
part 'mixins/search_params_mixin.dart';

final class SearchParamsViewModel extends ReactiveViewModel with _SearchParamsViewMixin, _SearchOfferMixin {
  SearchParamsViewModel() {
    initMixin();

    updateLocalSearchParams(activeSearchParams);
  }

  ///
  /// Dependencies
  ///
  final SearchParamsService _searchParamsService = locator<SearchParamsService>();

  SearchParamsService get _listenableSearchParamsService => listenableServices.first as SearchParamsService;

  ///
  /// Local variables
  ///
  final GlobalKey confirmButtonBusyIndicatorKey = GlobalKey();
  OffersResponseModel? _offerResponseModel;

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
  Future<void> _updateGlobalSearchParams(SearchParamsModel searchParams) async {
    await _searchParamsService.updateSearchParams(searchParams);
  }

  ///
  /// Delete the search parameters from the list
  ///
  Future<void> deleteSearhParam(SearchParamsModel searchParams) async {
    await _searchParamsService.deleteSearchParams(searchParams);
  }

  ///
  /// Confirm butonuna basıldığında mevcut Global SearchParamsModel'in güncellenmesi için kullanılır
  ///
  Future<void> onPressedSearchButton(BuildContext context) async {
    try {
      if (localSearchParams == null) {
        return;
      }

      ///
      /// Check if all text fields are valid
      ///
      checkValidAllTextFields();

      await runBusyFuture(
        _updateGlobalSearchParams(localSearchParams!),
      ).then((value) {
        Navigator.of(context).pop<OffersResponseModel?>(_offerResponseModel);
      });
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  ///
  /// Amount veya Expiry değerleri değiştiğinde tetiklenir ve olası uyarı mesajlarını basar ve kredi tekliflerini getirir
  ///
  Future<void> fetchOffersWithNewParams() async {
    try {
      if (localSearchParams == null || (isAmountValid(localSearchParams?.amount ?? 0) == false && isExpiryValid((localSearchParams?.expiry ?? 0).toDouble()) == false)) {
        return;
      }

      final result = await runBusyFuture(checkResponsesForNewParams(localSearchParams: localSearchParams!), busyObject: confirmButtonBusyIndicatorKey);

      if (result.limitFailure != null) {
        setErrorForModelOrObject(result.limitFailure, key: limitErrorKey);
      }
      if (result.successOfferResponse != null) {
        setExpiryValue((result.successOfferResponse!.maturity ?? localSearchParams!.loanType.lowerExpiryLimit).toDouble());
        _offerResponseModel = result.successOfferResponse;
      }
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
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
