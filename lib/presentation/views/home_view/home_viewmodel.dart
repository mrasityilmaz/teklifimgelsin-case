import 'package:flutter/material.dart';
import 'package:my_coding_setup/core/services/logger/logger_service.dart';
import 'package:my_coding_setup/data/enums/credit_type_enum.dart';
import 'package:my_coding_setup/data/models/offer_response_model/offers_response_model.dart';
import 'package:my_coding_setup/domain/repositories/offer_repository/i_offer_repository.dart';
import 'package:my_coding_setup/injection/injection_container.dart';
import 'package:stacked/stacked.dart';

final class HomeViewModel extends BaseViewModel {
  ///
  /// Dependencies
  ///
  final IOfferRepository _offerRepository = locator<IOfferRepository>();

  ///
  /// Offer List
  ///
  OffersResponseModel? _offersResponse;

  OffersResponseModel? get offersResponse => _offersResponse;

  Future<void> getOffers() async {
    try {
      await runBusyFuture(_offerRepository.getLoanOffersByType(loanType: LoanTypeEnum.personalFinanceLoan)).then(
        (value) => value.fold((l) => debugPrint(l.toString()), (r) {
          _offersResponse = r;

          notifyListeners();
        }),
      );
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  ///
  ///
  ///  Global Keys
  ///
}
