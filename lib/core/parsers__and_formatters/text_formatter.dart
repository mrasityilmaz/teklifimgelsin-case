import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:my_coding_setup/core/extensions/string_extension.dart';

///
///
///  CustomAmountFormatter used for formatting the amount input field which is loan amount picker
///
@immutable
final class CustomAmountFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Yalnızca rakamları korumak için regex kullanma
    final RegExp regex = RegExp('[0-9]');

    // Yeni girilen metinde yalnızca rakamları koruma
    final newText = regex.allMatches(newValue.text).map((match) => match.group(0)).join();

    if (newText == '0') {
      return oldValue;
    }

    int amount = 0;

    try {
      amount = int.tryParse(newText) ?? 0;

      if (amount > 300000) {
        amount = 300000;
      }
    } catch (e) {
      debugPrint('Error: $e');
    }

    final String formattedValue = newText.isNotEmpty ? NumberFormat('#,##0', 'tr_TR').format(amount) : ''; //
    return TextEditingValue(
      text: formattedValue.withTLSymbol,
      selection: TextSelection.collapsed(offset: formattedValue.length + 1),
    );
  }
}

@immutable
final class CustomMonthFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Yalnızca rakamları korumak için regex kullanma
    final RegExp regex = RegExp('[0-9]');

    // Yeni girilen metinde yalnızca rakamları koruma
    final String newText = regex.allMatches(newValue.text).map((match) => match.group(0)).join();

    int? amount;

    if (newText.isNotEmpty) {
      try {
        amount = int.tryParse(newText);

        if ((amount ?? 37) > 36) {
          amount = 36;
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    }

    final String formattedValue = amount == null ? ' Ay' : '$amount Ay';

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: regex.allMatches(formattedValue).map((match) => match.group(0)).join().length),
    );
  }
}
