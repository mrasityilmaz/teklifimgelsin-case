import 'package:teklifimgelsin_case/core/services/calculation_service/loan_calculation.dart';

class OfferLoanDetailModel {
  const OfferLoanDetailModel({
    required this.monthlyLoanPayment,
    required this.totalLoanPayment,
    required this.interestRate,
    required this.annualRate,
    required this.totalOfferValue,
    required this.expiry,
    required this.detailedPaymentPlanList,
    required this.processCost,
  });

  factory OfferLoanDetailModel.fromLoanDetail({required double? interestRate, required int mount, required double amountValue, required double? annualRate}) {
    return LoanCalculation.calculateMonthlyPaymentFromLoanDetails(interestRateValue: interestRate, mountValue: mount, amountValue: amountValue, annualRateValue: annualRate);
  }

  ///
  /// Aylık Taksit Tutarı
  ///
  final double monthlyLoanPayment;

  ///
  /// Total Ödenmesi Gereken Tutar
  ///
  final double totalLoanPayment;

  ///
  /// Faiz Oranı (Aylık)
  ///
  final double interestRate;

  ///
  /// Yıllık Faiz Oranı
  ///
  final double annualRate;

  ///
  /// Kredi Tutarı
  ///
  final double totalOfferValue;

  ///
  ///  Vade (Ay)
  ///
  final int expiry;

  ///
  /// Kredi masrafı
  ///
  final double processCost;

  final List<OfferLoanDetailedListModel> detailedPaymentPlanList;
}

class OfferLoanDetailedListModel {
  OfferLoanDetailedListModel({
    required this.monthIndex,
    required this.monthlyPayment,
    required this.anaPara,
    required this.interest,
    required this.kkdf,
    required this.bsmv,
    required this.kalanAnaPara,
  });

  final int monthIndex;
  final double monthlyPayment;
  final double anaPara;
  final double interest;
  final double kkdf;
  final double bsmv;
  final double kalanAnaPara;
}
