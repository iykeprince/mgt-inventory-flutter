import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked_services/stacked_services.dart';

class SwitchBranchDialog extends StatelessWidget {
  final SheetRequest? request;
  final Function(SheetResponse)? completer;

  const SwitchBranchDialog({
    Key? key,
    this.request,
    this.completer,
    required dialogRequest,
    required onDialogTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowDialogContainer(
        padding: EdgeInsets.all(0), child: Container(child: Text("data")));
  }
}
