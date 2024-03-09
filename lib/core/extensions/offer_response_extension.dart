import 'package:my_coding_setup/data/models/offer_response_model/offers_response_model.dart';

extension OffersResponseModelExtension on OffersResponseModel? {
  bool get hasActiveOffers => this?.activeOffers != null && this?.activeOffers?.isNotEmpty == true;

  bool get hasPassiveOffers => this?.passiveOffers != null && this?.passiveOffers?.isNotEmpty == true;

  bool get hasSponsoredOffers => this?.sponsoredOffers != null && this?.sponsoredOffers?.isNotEmpty == true;

  bool get hasAnyOffers => hasActiveOffers || hasPassiveOffers || hasSponsoredOffers;

  OffersResponseModel? get checkIfNull {
    if ((this?.activeOffers == null || this?.activeOffers?.isEmpty == true) &&
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
