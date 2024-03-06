import 'package:my_coding_setup/core/constants/loan_calculation.dart';

class OfferLoanDetailModel {
  const OfferLoanDetailModel({
    required this.monthlyPayment,
    required this.totalPayment,
    required this.interestRate,
  });

  factory OfferLoanDetailModel.fromString({required String? adContent}) {
    return LoanCalculation.calculateMonthlyPaymentFromString(adContent: adContent);
  }

  factory OfferLoanDetailModel.fromLoanDetail({required double? interestRate, required int mount, required double amountValue}) {
    return LoanCalculation.calculateMonthlyPaymentFromLoanDetails(interestRateValue: interestRate, mountValue: mount, amountValue: amountValue);
  }
  final String monthlyPayment;
  final String totalPayment;
  final String interestRate;
}
