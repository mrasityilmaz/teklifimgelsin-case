import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:teklifimgelsin_case/core/errors/errors.dart';
import 'package:teklifimgelsin_case/core/extensions/dartz_extension.dart';
import 'package:teklifimgelsin_case/core/services/mock_reader_service.dart';
import 'package:teklifimgelsin_case/data/models/offer_response_model/offers_response_model.dart';
import 'package:teklifimgelsin_case/data/models/search_params_model/search_params_model.dart';
import 'package:teklifimgelsin_case/domain/repositories/offer_repository/data_sources/iremote_repository.dart';
import 'package:teklifimgelsin_case/injection/injection_container.dart';

@Environment('mock')
@LazySingleton(as: IOfferRemoteRepository)
final class OfferMockRepository implements IOfferRemoteRepository {
  @override
  Future<DataModel<OffersResponseModel>> getLoanOffers({required SearchParamsModel searchParams}) async {
    try {
      final response = await locator<MockReaderService>().callMock<OffersResponseModel>(
        'test/fixtures/example_offers_response_json_${searchParams.loanType.value}.json',
        parseModel: OffersResponseModel.fromJson,
      );

      ///
      /// You can add some logic here to check if response is valid or not
      ///
      return Right(response);
    } catch (e) {
      if (e is Response) {
        ///
        /// This is the case when you have some error from parsing or something else
        ///
        return Left(UnExpectedFailure(data: e, errorMessage: e.statusMessage));
      } else {
        ///
        /// I dont know what is the error so I will return server failure
        ///

        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
