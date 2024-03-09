import 'package:flutter/material.dart';
import 'package:my_coding_setup/core/services/logger/logger_service.dart';
import 'package:my_coding_setup/data/models/offer_response_model/offers_response_model.dart';
import 'package:my_coding_setup/data/models/search_params_model/search_params_model.dart';
import 'package:my_coding_setup/data/services/search_params_service.dart';
import 'package:my_coding_setup/domain/repositories/offer_repository/i_offer_repository.dart';
import 'package:my_coding_setup/injection/injection_container.dart';
import 'package:stacked/stacked.dart';

final class HomeViewModel extends ReactiveViewModel {
  ///
  /// Dependencies
  ///
  final IOfferRepository _offerRepository = locator<IOfferRepository>();
  final SearchParamsService _searchParamsService = locator<SearchParamsService>();
  late final SearchParamsService _listenableSearchParamsService = listenableServices.first as SearchParamsService;

  ///
  /// Reactive Value's
  ///
  SearchParamsModel get activeSearchParams => _listenableSearchParamsService.activeSearchParams;

  ///
  /// Offer List
  ///
  OffersResponseModel? _offersResponse;

  OffersResponseModel? get offersResponse => _offersResponse;

  Future<void> getOffers() async {
    try {
      await runBusyFuture(
        _offerRepository.getLoanOffers(searchParams: activeSearchParams),
      ).then(
        (value) => value.fold((l) => debugPrint(l.toString()), setOfferList),
      );
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  void setOfferList(OffersResponseModel offersResponse) {
    _offersResponse = offersResponse;
    notifyListeners();
  }

  ////
  /// Listenable Services
  ///

  @override
  List<ListenableServiceMixin> get listenableServices => [_searchParamsService];
}
