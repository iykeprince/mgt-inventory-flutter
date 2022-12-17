import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:pos_mobile_ui_package/utils/font_styles.dart';
import 'package:pos_mobile_ui_package/utils/text_styles.dart';
import 'package:pos_mobile_ui_package/utils/values_manager.dart';

class AttachmentField extends StatelessWidget {
  const AttachmentField({
    Key? key,
    this.label,
    this.isOptional = true,
    required this.onTap,
  }) : super(key: key);

  final String? label;
  final bool isOptional;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null)
          Row(
            children: [
              Text(
                '$label',
                style: getBoldStyle(
                  color: ColorManager.kDarkColor,
                  fontSize: FontSize.s16,
                ),
              ),
              isOptional
                  ? Text(
                      '(optional)',
                      style: getMediumStyle(
                        color: ColorManager.kDarkCharcoal,
                        fontSize: FontSize.s16,
                      ),
                    )
                  : Container(),
            ],
          ),
        const SizedBox(height: AppSize.s16),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p24,
            vertical: AppPadding.p18,
          ),
          decoration: BoxDecoration(
            color: ColorManager.kAzureishWhite,
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
          child: Column(
            children: [
              Transform.rotate(
                angle: -45,
                child: const Icon(
                  Icons.attachment,
                  size: AppSize.s24,
                ),
              ),
              const SizedBox(height: AppSize.s16),
              RichText(
                text: TextSpan(
                  text: "Click here to ",
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          onTap();
                        },
                      text: "brower ",
                      style: getBoldStyle(
                        color: ColorManager.kSecondaryColor,
                        fontSize: FontSize.s16,
                      ),
                    ),
                    TextSpan(
                      text: "and upload attachments",
                      style: TextStyle(),
                    ),
                  ],
                  style: getBoldStyle(
                    color: ColorManager.kPrimaryColor,
                    fontSize: FontSize.s16,
                  ),
                ),
                textAlign: TextAlign.center,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ],
    );
  }
}
