import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:teklifimgelsin_case/core/errors/errors.dart';
import 'package:teklifimgelsin_case/core/extensions/dartz_extension.dart';
import 'package:teklifimgelsin_case/core/platform/network_info.dart';
import 'package:teklifimgelsin_case/data/models/offer_response_model/offers_response_model.dart';
import 'package:teklifimgelsin_case/data/models/search_params_model/search_params_model.dart';
import 'package:teklifimgelsin_case/domain/repositories/offer_repository/data_sources/ilocal_repository.dart';
import 'package:teklifimgelsin_case/domain/repositories/offer_repository/data_sources/iremote_repository.dart';
import 'package:teklifimgelsin_case/domain/repositories/offer_repository/i_offer_repository.dart';

@LazySingleton(as: IOfferRepository)
final class OfferRepository implements IOfferRepository {
  const OfferRepository({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  final IOfferRemoteRepository remoteDataSource;
  final IOfferLocalRepository localDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<DataModel<OffersResponseModel>> getLoanOffers({required SearchParamsModel searchParams}) async {
    if (await networkInfo.isConnected) {
      return remoteDataSource.getLoanOffers(searchParams: searchParams);
    } else {
      return Left(NetworkFailure());
    }
  }
}
