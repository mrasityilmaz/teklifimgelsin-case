import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_coding_setup/core/errors/errors.dart';
import 'package:my_coding_setup/core/extensions/dartz_extension.dart';
import 'package:my_coding_setup/data/enums/credit_type_enum.dart';
import 'package:my_coding_setup/data/models/offer_response_model/offers_response_model.dart';
import 'package:my_coding_setup/data/models/search_params_model/search_params_model.dart';
import 'package:my_coding_setup/domain/repositories/offer_repository/i_offer_repository.dart';
import 'package:my_coding_setup/injection/injection_container.dart';

void main() async {
  ///
  /// That part is unnecessary for testing but this way provides you to test your repository with your mock or real data.
  ///

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
