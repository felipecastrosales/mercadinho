import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class UtilsServices {
  priceToCurrency(double price) {
    var numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(price);
  }

  String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();
    var formatter = DateFormat.yMd('pt_BR').add_Hm();
    return formatter.format(dateTime);
  }
}
