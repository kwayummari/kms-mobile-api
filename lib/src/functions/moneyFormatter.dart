import 'package:intl/intl.dart';

Future<String> formatPrice(String number, String currencySymbol) async {
  int price = int.parse(number);
  String formattedPrice = NumberFormat('#,###').format(price);
  return formattedPrice + currencySymbol;
}
