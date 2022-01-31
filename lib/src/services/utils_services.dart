import 'package:intl/intl.dart';

class UtilsServices {
  priceToCurrency(double price) {
    var numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(price);
  }
}
