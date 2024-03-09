part of '../search_params_viewmodel.dart';

mixin _SearchOfferMixin on ReactiveViewModel {
  ///
  /// Dependencies
  ///
  final IOfferRepository _offerRepository = locator<IOfferRepository>();

  ///  ****
  ///  Bu kısım kullanıcı kredi miktarını değiştirdiğinde mevcut kredi miktarı ve vade değerini alır,
  ///  ardından mevcut vade değeri ve vade aralığı arasında olan tüm vade değerlerini bulup geri döner.
  ///  Bu sayede mesela kullanıcı 100.000 TL kredi miktarı ve 36 ay vadeli
  ///  ihtiyaç kredisi seçtiğinde 36 ay vade aralığından 36, 24, 12 ay vade değerlerini bulup geri döner.
  ///  Çünkü o kredi miktarı ve vade tutarında bir arama yapıldığında geriye hata dönecek ve
  ///  kullanıcıya bu parametrelerle bir arama yapamayacağı bilgisi verilecek.
  ///  Bunun önüne geçmek için kritik vade tutarları bulunup
  ///  mevcut kredi miktarı ile o vade aralıklarındaki tüm değerler için aynı anda istek atılacak.
  ///  Dönen response'lardan biri success ise geçerli parametreler o değerler ile güncellenecek ve
  ///  asıl değerler ile atılacak olan hata uyarısıda saklanıp kullanıcıya neden bunu yapmamız gerektiğini anlatan bir uyarı verilecek.
  ///  ****

  List<int> _findAvailableOfferExpiryLimits({required SearchParamsModel localSearchParams}) {
    try {
      final int stepExpiry = localSearchParams.loanType.stepExpiry;

      final List<int> expiryValues = List<int>.empty(growable: true);
      int loopExpiryValue = localSearchParams.expiry;

      expiryValues.add(loopExpiryValue);

      do {
        loopExpiryValue -= (loopExpiryValue % stepExpiry) != 0 ? (loopExpiryValue % stepExpiry) : stepExpiry;
        if (loopExpiryValue == 0) {
          break;
        }
        expiryValues.add(loopExpiryValue);
      } while (loopExpiryValue != stepExpiry);

      return expiryValues..sort();
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
      return [];
    }
  }

  List<SearchParamsModel> getAvailableSearchParams({required SearchParamsModel localSearchParams}) {
    try {
      final List<int> expiryValues = _findAvailableOfferExpiryLimits(localSearchParams: localSearchParams);

      if (expiryValues.isNotEmpty) {
        return expiryValues.map((e) => localSearchParams.copyWith(expiry: e)).toList();
      } else {
        return [localSearchParams];
      }
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
      return [localSearchParams];
    }
  }

  ///
  /// Amount slider değiştiğinde mevcut vade ve vadeler için uygun olan kredi tekliflerini getirir
  ///
  ///

  Future<({OffersResponseModel? successOfferResponse, OfferLimitFailure? limitFailure})> checkResponsesForNewParams({required SearchParamsModel localSearchParams}) async {
    ///
    /// Olası SearchParamsModel'leri bir liste olarak alır
    ///
    final availableSearchParams = getAvailableSearchParams(localSearchParams: localSearchParams);

    /// Başarılı olan istek sonuçları için
    final List<OffersResponseModel> availableOfferResponseList = List<OffersResponseModel>.empty(growable: true);

    /// Başarısız olan istek sonuçları için
    final List<OfferLimitFailure> offerLimitFailureList = List<OfferLimitFailure>.empty(growable: true);

    ///
    /// Her bir SearchParamsModel için kredi tekliflerini getirir
    ///
    await Future.wait(availableSearchParams.map((e) => _offerRepository.getLoanOffers(searchParams: e)).toList()).then((value) {
      clearLimitError();
      for (final element in value) {
        element.fold(
          (l) {
            if (l is OfferLimitFailure) {
              offerLimitFailureList.add(l);
            } else {
              setError(l.getErrorMessage);
            }
          },
          availableOfferResponseList.add,
        );
      }
    });

    final OffersResponseModel? nearestOfferResponse = availableOfferResponseList.isEmpty
        ? null
        : availableOfferResponseList.max((a, b) => (a.maturity ?? localSearchParams.loanType.lowerExpiryLimit).compareTo(b.maturity ?? localSearchParams.loanType.lowerExpiryLimit));

    final OfferLimitFailure? nearestOfferLimitFailure = offerLimitFailureList.firstWhereOrNull((element) => element.errorAmountValue == localSearchParams.amount);

    return (successOfferResponse: nearestOfferResponse, limitFailure: nearestOfferLimitFailure);
  }

  ///
  ///  Error Handling
  ///

  final GlobalKey limitErrorKey = GlobalKey();

  void clearLimitError() {
    setErrorForModelOrObject(null, key: limitErrorKey);
  }

  void setLimitError({required OfferLimitFailure failure}) {
    setErrorForModelOrObject(failure, key: limitErrorKey);
  }
}
