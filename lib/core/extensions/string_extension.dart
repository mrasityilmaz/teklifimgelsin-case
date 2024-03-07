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
