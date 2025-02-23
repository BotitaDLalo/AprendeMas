 import 'package:intl/intl.dart';

String formatDate(String dateString){
  DateTime date = DateTime.parse(dateString);
 String formattedString = DateFormat('dd-MM-yyyy HH:mm:ss').format(date);
  return formattedString;
 }