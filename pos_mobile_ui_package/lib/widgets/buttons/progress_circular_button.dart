import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';

class ProgressCircularButton extends StatelessWidget {
  ProgressCircularButton({
    Key? key,
    this.onPressed,
    this.progressValue = 0.1,
    this.icon = Icons.arrow_forward_ios,
  }) : super(key: key);

  Function()? onPressed;
  double progressValue;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 64,
          height: 64,
          child: CircularProgressIndicator(
            color: kSecondaryColor,
            value: progressValue,
            strokeWidth: 8,
            backgroundColor: Color(0xffDCEBE3),
          ),
        ),
        InkWell(
          onTap: onPressed,
          child: Container(
            width: 62.0,
            height: 62.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor,
            ),
            child: Center(
              child: Icon(
                icon,
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
