// ignore_for_file: omit_local_variable_types

import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:teklifimgelsin_case/data/models/offer_loan_detail_model/offer_loan_detail_model.dart';
import 'package:teklifimgelsin_case/data/models/offer_loan_detail_model/sponsored_offer_loan_detail_model.dart';

@immutable
final class LoanCalculation {
  const LoanCalculation._();

  static const double _costRatePerByGrand = 5.75;

  ///
  /// Metni parçalayarak aylık ödeme, toplam ödeme ve faiz oranını hesaplar
  ///
  ///
  static SponsoredOfferLoanDetailModel calculateMonthlyPaymentFromString({
    required String? adContent,
  }) {
    final text = adContent;

    // Düzenli ifade kullanarak metni parçalama

    // Eşleşmeleri al
    final match = text?.split('-') ?? [];

    if (match.isEmpty) {
      return const SponsoredOfferLoanDetailModel(monthlyPayment: '₺???', interestRate: '%???', totalPayment: '₺???*');
    }
    return SponsoredOfferLoanDetailModel(monthlyPayment: match[1], interestRate: match[3], totalPayment: match[5]);
  }

  ///
  /// Aktif teklif modellerinin kredi detaylarını hesaplar
  ///
  ///
  static OfferLoanDetailModel calculateMonthlyPaymentFromLoanDetails({required double? interestRateValue, required int mountValue, required double amountValue, required double? annualRateValue}) {
    final double offerAmount = amountValue; // Kredi miktarı
    final double monthlyInterestRate = interestRateValue ?? 0; // Faiz oranı Aylık (yüzde cinsinden)
    final int expiry = mountValue; // Vade (ay cinsinden)

    ///
    /// Aylık ödeme miktarını hesaplar
    ///
    final monthlyPayment = _calculateOfferLoanMonthlyPayment(monthlyInterestRate: monthlyInterestRate, offerAmount: offerAmount, expiry: expiry);

    ///
    /// Toplam ödeme miktarını hesaplar *
    ///
    final totalPayment = monthlyPayment * expiry;

    final detailedPaymentPlanList = _calculateMonthlyPlan(totalOfferValue: offerAmount, monthlyInterestRate: monthlyInterestRate, expiry: expiry, monthlyPayment: monthlyPayment);

    return OfferLoanDetailModel(
      monthlyLoanPayment: monthlyPayment,
      totalLoanPayment: totalPayment,
      interestRate: monthlyInterestRate,
      annualRate: annualRateValue ?? 0,
      totalOfferValue: offerAmount,
      expiry: expiry,
      detailedPaymentPlanList: detailedPaymentPlanList,
      processCost: _calculateProcessCost(totalOffer: offerAmount),
    );
  }

  ///
  /// aktif Teklif aylık ödeme miktarını hesaplar
  ///
  ///
  static double _calculateOfferLoanMonthlyPayment({required double monthlyInterestRate, required double offerAmount, required int expiry}) {
    final double totalInterestRate = monthlyInterestRate * 0.013;
    final double totalInterestRatePlusOne = 1 + totalInterestRate;

    final numerator = offerAmount * totalInterestRate * math.pow(totalInterestRatePlusOne, expiry);
    final denominator = math.pow(totalInterestRatePlusOne, expiry) - 1;

    return numerator / denominator;
  }

  static List<OfferLoanDetailedListModel> _calculateMonthlyPlan({required double totalOfferValue, required double monthlyInterestRate, required int expiry, required double monthlyPayment}) {
    final List<OfferLoanDetailedListModel> detailedPaymentPlanList = List<OfferLoanDetailedListModel>.empty(growable: true);

    double miktar = totalOfferValue;
    final double oran = monthlyInterestRate;
    final double aylikOdeme = monthlyPayment;
    for (int i = 1; i < expiry + 1; i++) {
      final double faiz = miktar * oran / 100;
      final double kkdf = faiz * 0.15;
      final double bsmv = faiz * 0.15;
      final double anapara = aylikOdeme - faiz - kkdf - bsmv;
      miktar -= anapara;
      detailedPaymentPlanList.add(
        OfferLoanDetailedListModel(
          monthIndex: i,
          monthlyPayment: aylikOdeme,
          anaPara: anapara,
          interest: faiz,
          kkdf: kkdf,
          bsmv: bsmv,
          kalanAnaPara: miktar,
        ),
      );
    }

    return detailedPaymentPlanList;
  }

  static double _calculateProcessCost({required double totalOffer}) {
    final double processCost = (totalOffer / 1000) * _costRatePerByGrand;
    return processCost;
  }
}
