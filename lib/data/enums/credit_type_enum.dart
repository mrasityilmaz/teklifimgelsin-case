// ignore_for_file: constant_identifier_names

enum LoanTypeEnum {
  personalFinanceLoan(0),

  houseLoan(1),

  vehicleLoan(2);

  const LoanTypeEnum(this.value);
  final int value;
}
