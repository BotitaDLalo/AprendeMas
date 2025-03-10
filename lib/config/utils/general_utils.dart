 import 'package:intl/intl.dart';

String formatDate(String dateString){
  DateTime date = DateTime.parse(dateString);
 String formattedString = DateFormat('dd-MM-yyyy HH:mm:ss').format(date);
  return formattedString;
 }

DateTime parseCustomDate(String dateString) {
  return DateFormat("dd-MM-yyyy HH:mm:ss").parse(dateString);
}

String formatOnlyDate(String dateString) {
  DateTime date = parseCustomDate(dateString);
  return DateFormat('dd-MM-yyyy').format(date);
}

String formatOnlyTime(String dateString) {
  DateTime date = parseCustomDate(dateString);
  return DateFormat('HH:mm').format(date);
}

