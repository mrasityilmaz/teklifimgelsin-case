extension StringExtension on String? {
  List<String>? get decodeToHtmlTag {
    if (this == null || this?.isEmpty == true) {
      return null;
    }
    final List<String> paragraphs = this!.split('\n');

    for (int i = 0; i < paragraphs.length; i++) {
      // Kalın yazılan ifadeleri bold olarak biçimlendirme
      paragraphs[i] = paragraphs[i].replaceAllMapped(
        RegExp('<b>(.*?)</b>'),
        (match) => '<b>${match.group(1)}</b>',
      );

      // İtalik yazılan ifadeleri italik olarak biçimlendirme
      paragraphs[i] = paragraphs[i].replaceAllMapped(
        RegExp('<i>(.*?)</i>'),
        (match) => '<i>${match.group(1)}</i>',
      );

      // Madde işaretlerini düzenleme
      if (paragraphs[i].startsWith('- ')) {
        paragraphs[i] = paragraphs[i].replaceFirst('- ', '• ');
      }
    }
    return paragraphs;
  }
}
