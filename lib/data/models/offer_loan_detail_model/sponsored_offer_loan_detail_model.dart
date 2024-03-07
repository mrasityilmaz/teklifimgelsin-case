import 'package:my_coding_setup/core/services/calculation_service/loan_calculation.dart';

class SponsoredOfferLoanDetailModel {
  const SponsoredOfferLoanDetailModel({
    required this.monthlyPayment,
    required this.totalPayment,
    required this.interestRate,
  });

  factory SponsoredOfferLoanDetailModel.fromString({required String? adContent}) {
    return LoanCalculation.calculateMonthlyPaymentFromString(adContent: adContent);
  }

  final String monthlyPayment;
  final String totalPayment;
  final String interestRate;
}
