import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked_services/stacked_services.dart';

class OpenBalanceBottomSheet extends StatelessWidget {
  final SheetRequest? request;
  final Function(SheetResponse)? completer;

  const OpenBalanceBottomSheet({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
        child: Column(
      children: [
        Text('${request!.title}'),
      ],
    ));
  }
}
