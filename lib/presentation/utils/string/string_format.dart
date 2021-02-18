import 'package:intl/intl.dart';

extension StringFormatter on String {
  String moneyFormat() {
    var numValue = num.tryParse(this).floor();

    if (numValue == null) {
      throw 'Parsing Error';
    }

    var formatter = new NumberFormat.currency(
      locale: 'en_US',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(numValue).replaceAll(',', '.');
  }
}
