import 'package:flutter/material.dart';

void dismissKeyboard(BuildContext context) {
  FocusScopeNode currentNode = FocusScope.of(context);
  if (currentNode.hasPrimaryFocus) {
    currentNode.unfocus();
  }
}

String getInitials(String name) => name.isNotEmpty
    ? name.trim().split(' ').map((l) => l[0]).take(2).join()
    : '';
