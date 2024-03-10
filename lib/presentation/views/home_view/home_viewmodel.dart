import 'package:flutter/material.dart';
import 'package:teklifimgelsin_case/core/extensions/offer_response_extension.dart';
import 'package:teklifimgelsin_case/core/services/logger/logger_service.dart';
import 'package:teklifimgelsin_case/data/models/offer_model/offer_model.dart';
import 'package:teklifimgelsin_case/data/models/offer_response_model/offers_response_model.dart';
import 'package:teklifimgelsin_case/data/models/search_params_model/search_params_model.dart';
import 'package:teklifimgelsin_case/data/models/sponsored_offer_model/sponsored_offer_model.dart';
import 'package:teklifimgelsin_case/data/services/search_params_service.dart';
import 'package:teklifimgelsin_case/domain/repositories/offer_repository/i_offer_repository.dart';
import 'package:teklifimgelsin_case/injection/injection_container.dart';
import 'package:stacked/stacked.dart';

final class HomeViewModel extends ReactiveViewModel {
  ///
  /// Dependencies
  ///
  final IOfferRepository _offerRepository = locator<IOfferRepository>();
  final SearchParamsService _searchParamsService = locator<SearchParamsService>();
  late final SearchParamsService _listenableSearchParamsService = listenableServices.first as SearchParamsService;
  final ScrollController scrollController = ScrollController();

  ///
  /// Reactive Value's
  ///
  SearchParamsModel get activeSearchParams => _listenableSearchParamsService.activeSearchParams;

  ///
  /// Offer List
  ///
  OffersResponseModel? _offersResponse;

  OffersResponseModel? get offersResponse => _offersResponse;

  ///
  /// Getters
  ///

  List<SponsoredOfferModel> get sponsoredOffers => offersResponse?.sponsoredOffers?.where((element) => element.checkIfNull != null).toList() ?? [];

  List<OfferModel> get activeOffers => offersResponse?.activeOffers?.where((element) => element.checkIfNull != null).toList() ?? [];

  List<OfferModel> get passiveOffers => offersResponse?.passiveOffers?.where((element) => element.checkIfNull != null).toList() ?? [];

  ///
  /// Methods
  ///

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

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
