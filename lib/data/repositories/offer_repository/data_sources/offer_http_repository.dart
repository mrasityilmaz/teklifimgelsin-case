import 'package:injectable/injectable.dart';
import 'package:my_coding_setup/core/extensions/dartz_extension.dart';
import 'package:my_coding_setup/data/enums/credit_type_enum.dart';
import 'package:my_coding_setup/data/models/offer_response_model/offers_response_model.dart';
import 'package:my_coding_setup/domain/repositories/offer_repository/data_sources/iremote_repository.dart';

@Environment('real')
@LazySingleton(as: IOfferRemoteRepository)
final class OfferHttpRepository implements IOfferRemoteRepository {
  @override
  Future<DataModel<OffersResponseModel>> getLoanOffersByType({required LoanTypeEnum loanType}) {
    // TODO: implement getLoanOffersByType
    throw UnimplementedError();
  }
}
