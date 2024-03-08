import 'package:my_coding_setup/core/extensions/dartz_extension.dart';
import 'package:my_coding_setup/data/models/offer_response_model/offers_response_model.dart';
import 'package:my_coding_setup/data/models/search_params_model/search_params_model.dart';

abstract class IOfferRepository {
  Future<DataModel<OffersResponseModel>> getLoanOffers({required SearchParamsModel searchParams});
}
