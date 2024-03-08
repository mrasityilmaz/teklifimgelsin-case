import 'package:flutter/material.dart';

extension StringExtension on String? {
  List<TextSpan>? get decodeToTextSpans {
    if (this == null || this?.isEmpty == true) {
      return null;
    }
    final List<TextSpan> paragraphs = this!
        .split('\n')
        .map(
          (e) => TextSpan(
            text: '$e\n'.replaceAll('**', '').replaceAll('*', '').replaceAll('-', '•').replaceAll('## ', ''),
            style: TextStyle(
              fontWeight: e.contains('**') || e.contains('##') ? FontWeight.w700 : FontWeight.w400,
              fontStyle: e.contains('*') && !e.contains('**') ? FontStyle.italic : FontStyle.normal,
            ),
          ),
        )
        .toList();

    return paragraphs;
  }
}

extension CurrencySymbolExtension on String {
  String get withTLSymbol {
    return '₺$this';
  }

  String get withPercentSymbol {
    return '%$this';
  }
}

extension StringToNumExtension on String? {
  int? get toIntOrNull {
    if (this == null || this?.isEmpty == true || this?._clearString == null || this?._clearString?.isEmpty == true) {
      return null;
    }
    return int.tryParse(this!._clearString!);
  }

  double? get toDoubleOrNull {
    if (this == null || this?.isEmpty == true || this?._clearString == null || this?._clearString?.isEmpty == true) {
      return null;
    }
    return double.tryParse(this!._clearString!);
  }

  String? get _clearString {
    return this?.replaceAll(RegExp('[^0-9]'), '');
  }
}
