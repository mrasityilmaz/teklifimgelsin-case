// ignore_for_file: omit_local_variable_types

import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:my_coding_setup/data/models/offer_loan_detail_model/offer_loan_detail_model.dart';

@immutable
final class LoanCalculation {
  const LoanCalculation._();

  static OfferLoanDetailModel calculateMonthlyPaymentFromString({
    required String? adContent,
  }) {
    final text = adContent;

    // Düzenli ifade kullanarak metni parçalama

    // Eşleşmeleri al
    final match = text?.split('-') ?? [];

    if (match.isEmpty) {
      return const OfferLoanDetailModel(monthlyPayment: '₺???', interestRate: '%???', totalPayment: '₺???*');
    }
    return OfferLoanDetailModel(monthlyPayment: match[1], interestRate: match[3], totalPayment: match[5]);
  }

  static OfferLoanDetailModel calculateMonthlyPaymentFromLoanDetails({required double? interestRateValue, required int mountValue, required double amountValue}) {
    final double amount = amountValue; // Kredi miktarı

    final double interestRate = interestRateValue ?? 0; // Faiz oranı (yüzde cinsinden)
    final int expiry = mountValue; // Vade (ay cinsinden)

    final double totalInterestRate = interestRate * 0.013;
    final double totalInterestRatePlusOne = 1 + totalInterestRate;

    final numerator = amount * totalInterestRate * math.pow(totalInterestRatePlusOne, expiry);
    final denominator = math.pow(totalInterestRatePlusOne, expiry) - 1;

    final monthlyPayment = numerator / denominator;

    final totalPayment = monthlyPayment * expiry;

    return OfferLoanDetailModel(monthlyPayment: '₺${monthlyPayment.toStringAsFixed(2)}', interestRate: '%${interestRate.toStringAsFixed(2)}', totalPayment: '₺${totalPayment.toStringAsFixed(2)}*');
  }
}
