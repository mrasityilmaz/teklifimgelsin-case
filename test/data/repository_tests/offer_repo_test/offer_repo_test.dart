import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teklifimgelsin_case/core/errors/errors.dart';
import 'package:teklifimgelsin_case/core/extensions/dartz_extension.dart';
import 'package:teklifimgelsin_case/data/enums/credit_type_enum.dart';
import 'package:teklifimgelsin_case/data/models/offer_response_model/offers_response_model.dart';
import 'package:teklifimgelsin_case/data/models/search_params_model/search_params_model.dart';
import 'package:teklifimgelsin_case/domain/repositories/offer_repository/i_offer_repository.dart';
import 'package:teklifimgelsin_case/injection/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///
  /// Dependency Injection Configuration for Mock Data
  /// You can change the default environment from here.
  ///
  ///
  await configureDependencies(defaultEnv: 'mock');

  ///
  /// Here is the repository definition.
  ///
  late IOfferRepository offerRepository;
  setUp(() {
    offerRepository = locator<IOfferRepository>();
  });

  group('Offers Repository Fetch-ModelParse Tests', () {
    test('personalFinanceLoan Test', () async {
      final result = await offerRepository.getLoanOffers(searchParams: const SearchParamsModel(amount: 100000, expiry: 12, loanType: LoanTypeEnum.personalFinanceLoan, id: '1'));

      expect(result, isA<Right<Failure, OffersResponseModel>>());
      expect(result.asRight(), isA<OffersResponseModel>());
      expect(result.asRight().type, LoanTypeEnum.personalFinanceLoan.value.toString());
    });
    test('houseLoan Test', () async {
      final result = await offerRepository.getLoanOffers(searchParams: const SearchParamsModel(amount: 100000, expiry: 12, loanType: LoanTypeEnum.houseLoan, id: '2'));

      expect(result, isA<Right<Failure, OffersResponseModel>>());
      expect(result.asRight(), isA<OffersResponseModel>());
      expect(result.asRight().type, LoanTypeEnum.houseLoan.value.toString());
    });
    test('vehicleLoan Test', () async {
      final result = await offerRepository.getLoanOffers(searchParams: const SearchParamsModel(amount: 100000, expiry: 12, loanType: LoanTypeEnum.vehicleLoan, id: '1'));

      expect(result, isA<Right<Failure, OffersResponseModel>>());
      expect(result.asRight(), isA<OffersResponseModel>());
      expect(result.asRight().type, LoanTypeEnum.vehicleLoan.value.toString());
    });
  });
}
