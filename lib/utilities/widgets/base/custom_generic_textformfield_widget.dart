import 'package:flutter/material.dart';

import 'package:mmg_companion/constants/colors.dart';
import 'package:mmg_companion/utilities/widgets/custom_text_widgets.dart';

class CustomGenericTextFormField extends StatelessWidget {
  final String initialValue;
  final String labelText;
  final String hintText;
  final Function(String changedValue) onChanged;
  final AutovalidateMode autovalidateMode;
  final String? Function(String? value)? validator;
  final bool obscureText;
  final IconButton? iconButton;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  const CustomGenericTextFormField({
    super.key,
    required this.initialValue,
    required this.labelText,
    required this.hintText,
    required this.onChanged,
    required this.autovalidateMode,
    required this.validator,
    required this.textInputType,
    required this.textInputAction,
    required this.obscureText,
    required this.iconButton,
  });

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: [
  //       SizedBox(
  //         height: 60,
  //         width: double.infinity,
  //         child: TextFormField(
  //           initialValue: initialValue,
  //           style: customBodyTextStyle,
  //           decoration: InputDecoration(
  //             labelText: labelText,
  //             labelStyle: customBodyTextStyle,
  //             hintText: hintText,
  //             hintStyle: customBodyTextStyle,
  //             suffixIcon: iconButton,
  //             contentPadding:
  //                 const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
  //             enabledBorder: OutlineInputBorder(
  //               borderRadius: const BorderRadius.all(Radius.circular(10)),
  //               borderSide: BorderSide(color: primaryColor),
  //             ),
  //             focusedBorder: OutlineInputBorder(
  //               borderRadius: const BorderRadius.all(Radius.circular(10)),
  //               borderSide: BorderSide(color: primaryColor),
  //             ),
  //           ),
  //           onChanged: onChanged,
  //           autovalidateMode: autovalidateMode,
  //           validator: validator,
  //           keyboardType: textInputType,
  //           textInputAction: textInputAction,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      style: customBodyTextStyle,
      autovalidateMode: autovalidateMode,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: customBodyTextStyle,
        hintText: hintText,
        hintStyle: customBodyTextStyle,
        suffixIcon: iconButton,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 22,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          // borderSide: BorderSide(color: Colors.red),
          borderSide: BorderSide(color: primaryColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          // borderSide: BorderSide(color: Colors.red),
          borderSide: BorderSide(color: primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: primaryColor),
        ),
      ),
      keyboardType: textInputType,
      textInputAction: textInputAction,
      onChanged: onChanged,
    );
  }
}
