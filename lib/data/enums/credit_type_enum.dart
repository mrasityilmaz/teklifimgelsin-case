// ignore_for_file: constant_identifier_names

enum LoanTypeEnum {
  personalFinanceLoan(value: 0, text: 'İhtiyaç Kredisi', upperAmountLimit: 300000, lowerAmountLimit: 1000, stepAmount: 1000, upperExpiryLimit: 36, lowerExpiryLimit: 1, stepExpiry: 12),

  houseLoan(value: 1, text: 'Konut Kredisi', upperAmountLimit: 5000000, lowerAmountLimit: 100000, stepAmount: 50000, upperExpiryLimit: 240, lowerExpiryLimit: 1, stepExpiry: 24),

  vehicleLoan(value: 2, text: 'Taşıt Kredisi', upperAmountLimit: 400000, lowerAmountLimit: 50000, stepAmount: 10000, upperExpiryLimit: 48, lowerExpiryLimit: 1, stepExpiry: 12),
  ;

  const LoanTypeEnum({
    required this.value,
    required this.text,
    required this.upperAmountLimit,
    required this.lowerAmountLimit,
    required this.stepAmount,
    required this.upperExpiryLimit,
    required this.lowerExpiryLimit,
    required this.stepExpiry,
  });
  final int value;
  final String text;
  final double upperAmountLimit;
  final double lowerAmountLimit;
  final double stepAmount;
  final int upperExpiryLimit;
  final int lowerExpiryLimit;
  final int stepExpiry;
}
