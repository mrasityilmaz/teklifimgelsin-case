import 'package:my_coding_setup/core/extensions/dartz_extension.dart';
import 'package:my_coding_setup/data/enums/credit_type_enum.dart';
import 'package:my_coding_setup/data/models/offer_response_model/offers_response_model.dart';

abstract class IOfferRemoteRepository {
  Future<DataModel<OffersResponseModel>> getLoanOffersByType({required LoanTypeEnum loanType});
}
