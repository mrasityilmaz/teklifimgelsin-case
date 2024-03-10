import 'package:teklifimgelsin_case/data/models/offer_model/offer_model.dart';
import 'package:teklifimgelsin_case/data/models/offer_response_model/offers_response_model.dart';
import 'package:teklifimgelsin_case/data/models/sponsored_offer_model/sponsored_offer_model.dart';

extension OffersResponseModelExtension on OffersResponseModel? {
  bool get hasActiveOffers => this?.activeOffers != null && this?.activeOffers?.isNotEmpty == true;

  bool get hasPassiveOffers => this?.passiveOffers != null && this?.passiveOffers?.isNotEmpty == true;

  bool get hasSponsoredOffers => this?.sponsoredOffers != null && this?.sponsoredOffers?.isNotEmpty == true;

  bool get hasAnyOffers => hasActiveOffers || hasPassiveOffers || hasSponsoredOffers;

  OffersResponseModel? get checkIfNull {
    if (this == null) {
      return null;
    } else if ((this?.activeOffers == null || this?.activeOffers?.isEmpty == true) &&
        (this?.amount == null) &&
        (this?.carCondition == null) &&
        (this?.clientId == null) &&
        (this?.id == null) &&
        (this?.maturity == null) &&
        (this?.passiveOffers == null || this?.passiveOffers?.isEmpty == true) &&
        (this?.sponsoredOffers == null || this?.sponsoredOffers?.isEmpty == true) &&
        (this?.type == null || this?.type?.isEmpty == true)) {
      return null;
    } else {
      return this!;
    }
  }
}

extension SponsoredOfferModelExtension on SponsoredOfferModel? {
  ///
  /// Kredi detayları bu değerlere bağlı olduğu için, bu değerlerin null olduğu bir model null'dan farksızdır.
  ///
  SponsoredOfferModel? get checkIfNull {
    if (this == null) {
      return null;
    } else if (this?.adContent == null || this?.adContent?.isEmpty == true) {
      return null;
    }
    return this;
  }
}

extension OfferModelExtension on OfferModel? {
  ///
  /// Kredi detayları bu değerlere bağlı olduğu için, bu değerlerin null olduğu bir model null'dan farksızdır.
  ///
  OfferModel? get checkIfNull {
    if (this == null) {
      return null;
    } else if (this?.interestRate == null && this?.annualRate == null) {
      return null;
    }
    return this;
  }
}
