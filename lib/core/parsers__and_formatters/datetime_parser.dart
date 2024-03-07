import 'package:flutter/foundation.dart';

@immutable
final class DateTimeParser {
  static DateTime? parseDateTime(String? dateTime) {
    if (dateTime == null) {
      return null;
    }

    final iso8601StringTarih = dateTime.replaceAllMapped(RegExp(r'(\w+), (\d+) (\w+) (\d+) (\d+):(\d+):(\d+) GMT'), (Match m) {
      final months = {
        'Jan': '01',
        'Feb': '02',
        'Mar': '03',
        'Apr': '04',
        'May': '05',
        'Jun': '06',
        'Jul': '07',
        'Aug': '08',
        'Sep': '09',
        'Oct': '10',
        'Nov': '11',
        'Dec': '12',
      };
      return '${m[4]}-${months[m[3]]}-${m[2]?.padLeft(2, '0')}T${m[5]?.padLeft(2, '0')}:${m[6]?.padLeft(2, '0')}:${m[7]?.padLeft(2, '0')}Z';
    });

    // ISO 8601 formatındaki string tarih bilgisini DateTime nesnesine dönüştürün
    final dateTimeTarih = DateTime.tryParse(iso8601StringTarih);
    return dateTimeTarih;
  }
}
