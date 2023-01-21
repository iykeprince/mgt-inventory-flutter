import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void dismissKeyboard(BuildContext context) {
  FocusScopeNode currentNode = FocusScope.of(context);
  if (currentNode.hasPrimaryFocus) {
    currentNode.unfocus();
  }
}

String getInitials(String name) => name.isNotEmpty
    ? name.trim().split(' ').map((l) => l[0]).take(2).join()
    : '';

String calculateTotalWithdrawal(
    double cardWithdrawal, double transferWithdrawal) {
  return formatCurrency(cardWithdrawal + transferWithdrawal);
}

String formatCurrency(double value) {
  final oCcy = NumberFormat("#,##0", "en_US");
  return oCcy.format(value);
}

String formatDate(String value) {
  DateFormat dtInputFormat = DateFormat('dd-MMM-yyyy');
  DateTime input = dtInputFormat.parse(value);
  return DateFormat.yMd().format(input);
}

DateTime parseDate(String value) {
  DateFormat dtInputFormat = DateFormat('dd-MMM-yyyy');
  DateTime input = dtInputFormat.parse(value);
  return input;
}

double pieChartCalculate(double total, double value) {
  print('total: $total, value: $value');
  double result = value / total;
  print('result: $result, boool ${result.isNaN}');
  return result.isNaN ? 20.0 : result * 360;
}
