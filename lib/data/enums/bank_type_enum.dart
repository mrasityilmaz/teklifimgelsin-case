// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

enum BankType {
  @JsonValue('kamu')
  KAMU,
  @JsonValue('katilim')
  KATILIM,
  @JsonValue('ozel')
  OZEL
}
