import 'package:flutter/material.dart';

import '../theme/base_color.dart';
import '../theme/base_text_style.dart';

Widget commonTextField({
  TextEditingController? controller,
  required String hintText,
  void Function(String)? onFieldSubmitted,
  int? maxLength,
  TextStyle? hintStyle,
  TextStyle? textStyle,
  bool isPass = false,
  bool readOnly = false,
  String? counterText,
  GestureTapCallback? onTap,
  bool? filled,
  InputBorder? border,
  Color? filledColor,
  TextInputType? keyboardType,
  Widget? suffix,
  Widget? prefix,
  TextAlign textAlign = TextAlign.start,
  bool isDense = false,
  FormFieldValidator<String>? validator,
  Function? change,
  int? maxLines = 1,
}) {
  bool ispassVisible = true;
  return StatefulBuilder(builder: (context, newSetState) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 1),
      child: TextFormField(
        maxLength: maxLength,
        textAlign: textAlign,
        onTap: onTap,
        controller: controller,
        cursorColor: colorPrimary,
        keyboardType: keyboardType,
        obscureText: isPass ? ispassVisible : isPass,
        style: textStyle ?? commonTextFieldTextStyle,
        onChanged: (val) {
          newSetState(() {
            if (change != null) {
              change(val);
            }
          });
        },
        onEditingComplete: () {},
        onSaved: (val) {
          print("Filed Saved : $val");
        },
        onFieldSubmitted: (val) {
          if (onFieldSubmitted != null) {
            onFieldSubmitted(val);
          }
        },
        readOnly: readOnly,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          counterText: counterText,
          contentPadding: const EdgeInsets.all(8),
          isDense: isDense,
          prefixIcon: prefix,
          hintText: hintText,
          hintStyle: hintStyle ?? hintTextStyle,
          fillColor: filledColor ?? appWhite,
          filled: filled ?? true,
          enabledBorder: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: textFieldBorder),
              ),
          focusedBorder: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: textFieldBorder),
              ),
          errorBorder: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: appRed),
              ),
          focusedErrorBorder: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: appRed),
              ),
          suffixIcon: isPass
              ? InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    newSetState(() {
                      ispassVisible = !ispassVisible;
                    });
                  },
                  child: Icon(
                      ispassVisible
                          ? Icons.visibility_off
                          : Icons.visibility_rounded,
                      color: appGrey),
                )
              : suffix,
        ),
        maxLines: maxLines,
        validator: validator,
      ),
    );
  });
}
