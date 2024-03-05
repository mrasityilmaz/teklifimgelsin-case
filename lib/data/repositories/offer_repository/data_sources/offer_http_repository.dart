import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_coding_setup/core/errors/errors.dart';
import 'package:my_coding_setup/core/extensions/dartz_extension.dart';
import 'package:my_coding_setup/data/enums/credit_type_enum.dart';
import 'package:my_coding_setup/data/models/offer_response_model/offers_response_model.dart';
import 'package:my_coding_setup/data/requests/loan_offer_requests/get_loan_offers_by_type_request.dart';
import 'package:my_coding_setup/domain/repositories/offer_repository/data_sources/iremote_repository.dart';
import 'package:my_coding_setup/injection/injection_container.dart';
import 'package:rest_api_package/rest_api_package.dart';

@Environment('real')
@LazySingleton(as: IOfferRemoteRepository)
final class OfferHttpRepository implements IOfferRemoteRepository {
  @override
  Future<DataModel<OffersResponseModel>> getLoanOffersByType({required LoanTypeEnum loanType}) async {
    try {
      final response = await _restApiHttpService.requestAndHandle<OffersResponseModel?>(
        GetLoanOffersRequest(loanType: loanType, loanAmount: 10000, loanTerm: 24),
        parseModel: OffersResponseModel.fromJson,
      );

      if (response is OffersResponseModel) {
        return Right(response);
      } else {
        return Left(ServerFailure(errorMessage: 'server_error'));
      }
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'server_error'));
    }
  }

  RestApiHttpService get _restApiHttpService => locator<RestApiHttpService>();
}
