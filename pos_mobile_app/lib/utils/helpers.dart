import 'package:flutter/material.dart';

void dismissKeyboard(BuildContext context) {
  FocusScopeNode currentNode = FocusScope.of(context);
  if (currentNode.hasPrimaryFocus) {
    currentNode.unfocus();
  }
}
