import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:pos_mobile_ui_package/utils/font_styles.dart';
import 'package:pos_mobile_ui_package/utils/text_styles.dart';
import 'package:pos_mobile_ui_package/utils/values_manager.dart';

class InputField extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final TextAlign? textAlign;
  final TextInputType? keyBoardType;
  final String? Function(String? val)? validationCallback;
  final void Function()? onEdittingComplete;
  final String? formError;
  final String label;
  final String? hintText;
  final FocusNode? focusnode;
  final TextEditingController? controller;
  final String? message;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Function()? clearForm;
  final Function()? onTap;
  final Function(String)? onChange;
  final int? maxLength;
  final bool? enabled;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final Color? fillColor;
  final bool? showCursor;
  final bool readOnly;

  const InputField({
    this.autovalidateMode,
    this.inputFormatters,
    this.textAlign,
    this.keyBoardType,
    this.onEdittingComplete,
    this.validationCallback,
    this.message,
    this.hintText,
    this.label = '',
    this.formError,
    this.focusnode,
    this.controller,
    this.clearForm,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.onChange,
    this.onTap,
    this.maxLength,
    this.enabled = true,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.fillColor,
    this.showCursor,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: getRegularStyle(
              color: ColorManager.kDarkCharcoal,
              fontSize: FontSize.s14,
            ),
          ),
          const SizedBox(
            height: AppSize.s4,
          ),
          TextFormField(
            showCursor: showCursor,
            readOnly: readOnly,
            maxLength: maxLength,
            enabled: enabled,
            onTap: onTap,
            autovalidateMode: autovalidateMode,
            focusNode: focusnode,
            controller: controller,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              counterText: '',
              // labelStyle: getRegularStyle(
              // color: ColorManager.kDarkCharcoal, fontSize: FontSize.s14),
              hintStyle: getRegularStyle(
                  color: ColorManager.kGrey2, fontSize: FontSize.s16),
              border: border ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: ColorManager.kTransparent),
                  ),
              enabledBorder: enabledBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: ColorManager.kTransparent),
                  ),
              focusedBorder: focusedBorder,
              // alignLabelWithHint: true,
              // labelText: label,
              isDense: true,
              hintText: hintText,
              errorText: formError,
              contentPadding:
                  const EdgeInsets.only(left: 16, top: 18, bottom: 16),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              fillColor: fillColor ?? ColorManager.kInputBgColor,
              filled: true,
            ),
            textAlign: textAlign ?? TextAlign.start,
            style: getRegularStyle(
              color: ColorManager.kGrey2,
              fontSize: FontSize.s16,
            ),
            inputFormatters: inputFormatters,
            validator: validationCallback,
            keyboardType: keyBoardType,
            onChanged: (val) {
              if (clearForm != null) {
                clearForm!();
              }
              if (onChange != null) {
                onChange!(val);
              }
            },
            onEditingComplete: onEdittingComplete,
            obscureText: obscureText ?? false,
          ),
        ],
      ),
    );
  }
}
