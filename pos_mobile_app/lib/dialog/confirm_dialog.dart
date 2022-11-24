import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked_services/stacked_services.dart';

class ConfirmDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const ConfirmDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          Text(request.title!),
          Text(request.description!),
          Row(
            children: [
              PosButton(
                  onPressed: () => completer(DialogResponse(confirmed: true)),
                  title: request.mainButtonTitle!),
              PosButton(
                  onPressed: () => completer(DialogResponse(confirmed: false)),
                  title: request.secondaryButtonTitle!),
            ],
          )
        ],
      ), /* Build your dialog UI here */
    );
  }
}
