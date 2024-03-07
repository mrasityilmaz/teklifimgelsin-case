extension CurrencyExtension on num? {
  String get formatToTRCurrency {
    if (this == null) {
      return '';
    }
    final String formattedAmount = this!.toStringAsFixed(2); // İlk adımda double'ı stringe çeviririz.

    final List<String> parts = formattedAmount.split('.'); // Virgül ile ayırırız.
    final String beforeDecimal = parts[0]; // Virgül öncesini alırız.
    final String afterDecimal = parts[1]; // Virgül sonrasını alırız.

    // Virgül öncesi kısmı 3'er haneli gruplara ayırırız.
    String formattedBeforeDecimal = '';
    for (int i = beforeDecimal.length - 1; i >= 0; i -= 3) {
      final int startIndex = i - 2 >= 0 ? i - 2 : 0;
      formattedBeforeDecimal = '${beforeDecimal.substring(startIndex, i + 1)}.$formattedBeforeDecimal';
    }
    formattedBeforeDecimal = formattedBeforeDecimal.substring(0, formattedBeforeDecimal.length - 1); // Son virgülü sileriz.

    final String result = '$formattedBeforeDecimal,$afterDecimal'; // Yeniden birleştiririz.

    return result;
  }
}
