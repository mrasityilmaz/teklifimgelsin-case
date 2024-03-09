import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_coding_setup/core/errors/errors.dart';
import 'package:my_coding_setup/core/extensions/dartz_extension.dart';
import 'package:my_coding_setup/core/extensions/offer_response_extension.dart';
import 'package:my_coding_setup/data/models/offer_response_model/offers_response_model.dart';
import 'package:my_coding_setup/data/models/search_params_model/search_params_model.dart';
import 'package:my_coding_setup/data/requests/loan_offer_requests/get_loan_offers_by_type_request.dart';
import 'package:my_coding_setup/domain/repositories/offer_repository/data_sources/iremote_repository.dart';
import 'package:my_coding_setup/injection/injection_container.dart';
import 'package:rest_api_package/rest_api_package.dart';

@Environment('real')
@LazySingleton(as: IOfferRemoteRepository)
final class OfferHttpRepository implements IOfferRemoteRepository {
  RestApiHttpService get _restApiHttpService => locator<RestApiHttpService>();

  @override
  Future<DataModel<OffersResponseModel>> getLoanOffers({required SearchParamsModel searchParams}) async {
    try {
      final response = await _restApiHttpService.request(
        GetLoanOffersRequest(loanType: searchParams.loanType, loanAmount: searchParams.amount, loanTerm: searchParams.expiry),
      );

      ///
      /// If the response is successful and the data is not null
      ///
      if ((response.statusCode == 200 || response.statusCode == 201) && response.data != null) {
        final OffersResponseModel offersResponseModel = OffersResponseModel.fromJson(response.data as Map<String, dynamic>);

        ///
        /// Check if the response really offerResponseModel  is not null
        ///
        if (offersResponseModel.checkIfNull != null) {
          return Right(offersResponseModel);
        } else {
          ///
          /// If the response is not null but the offerResponseModel is null and the error message is not null
          ///
          if ((response.data as Map<String, dynamic>).containsKey('error_message')) {
            return Left(
              OfferLimitFailure(errorMessage: (response.data as Map<String, dynamic>)['error_message'].toString(), errorAmountValue: searchParams.amount, errorExpiryValue: searchParams.expiry),
            );
          }

          ///
          /// If the response is not null but the offerResponseModel is null and the error message is null
          ///
          return Left(ServerFailure(errorMessage: 'Bilinmeyen bir hata oluştu'));
        }
      } else {
        if ((response.data as Map<String, dynamic>).containsKey('error_message')) {
          return Left(
            OfferLimitFailure(errorMessage: (response.data as Map<String, dynamic>)['error_message'].toString(), errorAmountValue: searchParams.amount, errorExpiryValue: searchParams.expiry),
          );
        }

        return Left(ServerFailure(errorMessage: 'Bilinmeyen bir hata oluştu'));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(errorMessage: e.message));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
