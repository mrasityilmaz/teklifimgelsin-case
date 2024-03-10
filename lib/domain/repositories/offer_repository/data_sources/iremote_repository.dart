import 'package:teklifimgelsin_case/core/extensions/dartz_extension.dart';
import 'package:teklifimgelsin_case/data/models/offer_response_model/offers_response_model.dart';
import 'package:teklifimgelsin_case/data/models/search_params_model/search_params_model.dart';

abstract class IOfferRemoteRepository {
  Future<DataModel<OffersResponseModel>> getLoanOffers({required SearchParamsModel searchParams});
}
