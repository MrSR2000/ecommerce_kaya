import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/theme/app_themes.dart';

enum TextFormStyle {
  bgWithNoBorder,
  borderWithNoBg,
}

String? validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return value!.isEmpty || !regex.hasMatch(value)
      ? 'Enter a valid email address'
      : null;
}

class TextFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final int minLines;
  final TextInputType? textInputType;
  final Color fillColor;
  final IconData? prefixIcon;
  final Widget? suffixWidget;
  final String? labelText;
  final TextStyle textStyle;
  final TextFormStyle textFormStyle;
  final bool enableBorder;
  final Widget? prefixWidget;
  final TextInputAction textInputAction;
  final dynamic onFieldSubmitted;
  final String? customErrorMessage;
  final bool obstructText;
  final bool noSpace;
  final Function(String)? onChanged;
  final TextAlign textAlign;
  const TextFormWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.minLines = 1,
    this.textInputType = TextInputType.text,
    this.fillColor = const Color.fromARGB(255, 233, 232, 232),
    this.prefixIcon,
    this.labelText,
    this.textStyle = const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    this.textFormStyle = TextFormStyle.borderWithNoBg,
    this.enableBorder = true,
    this.prefixWidget,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.customErrorMessage,
    this.suffixWidget,
    this.obstructText = false,
    this.noSpace = false,
    this.textAlign = TextAlign.start,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign,
      controller: controller,
      obscureText: obstructText,
      inputFormatters: textInputType == TextInputType.number
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp("[0-9]")),
            ]
          : noSpace
              ? [
                  FilteringTextInputFormatter.deny(
                      RegExp(r'\s')), // Deny spaces
                ]
              : null, // Only numbers can be entered
      // autofocus: true,

      onTapOutside: (event) {
        FocusScopeNode currentFocus = FocusScope.of(context);

        //close keyboard on tapping outside
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      onChanged: onChanged,
      style: textStyle,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: textInputType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return customErrorMessage ?? 'Please enter required value';
        }
        if (textInputType == TextInputType.emailAddress) {
          return validateEmail(value);
        }
        return null;
      },
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.bodySmall,
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Icon(
                  prefixIcon,
                  color: Colors.grey[400]!,
                  size: 18,
                ),
              )
            : null,
        prefix: prefixWidget,
        suffixIcon: suffixWidget,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.grey), // White hint text color
        fillColor: fillColor, // Grey background color
        filled: true,
        contentPadding:
            const EdgeInsets.all(12.0), // Padding inside the text field
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // Border radius
          borderSide: BorderSide(
            color: primaryColor, // Border color
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // 8px border radius
          borderSide: enableBorder
              ? const BorderSide(color: Colors.grey)
              : BorderSide.none, // No border
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // 8px border radius
          borderSide: enableBorder
              ? const BorderSide(color: Colors.grey)
              : BorderSide.none, // No border
        ),
      ),

      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
