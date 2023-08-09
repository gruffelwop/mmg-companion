import 'package:flutter/material.dart';

import 'package:mmg_companion/constants/colors.dart';
import 'package:mmg_companion/utilities/widgets/custom_margin_widget.dart';
import 'package:mmg_companion/utilities/widgets/custom_text_widgets.dart';

class CustomConditionalTextFormField extends StatelessWidget {
  final bool condition;
  final String initialValue;
  final String labelText;
  final String hintText;
  final bool isInputNotValid;
  final Function(String changedValue) onChanged;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;

  const CustomConditionalTextFormField({
    super.key,
    required this.condition,
    required this.initialValue,
    required this.labelText,
    required this.hintText,
    required this.isInputNotValid,
    required this.onChanged,
    required this.textInputType,
    required this.textInputAction,
    this.validator,
  });

  // @override
  // Widget build(BuildContext context) {
  //   return condition == true
  //       ? CustomTextTextFormField(
  //           initialValue: initialValue,
  //           labelText: labelText,
  //           hintText: hintText,
  //           onChanged: onChanged,
  //           autovalidateMode: autovalidateMode,
  //           validator: validator,
  //           textInputType: textInputType,
  //           textInputAction: textInputAction,
  //         )
  //       : Container();
  // }

  @override
  Widget build(BuildContext context) {
    return condition == true
        ? Column(
            children: [
              const CustomMargin(amount: 5),
              TextFormField(
                initialValue: initialValue,
                style: customBodyTextStyle,
                decoration: InputDecoration(
                  // errorStyle: const TextStyle(height: 0),
                  labelText: labelText,
                  labelStyle: customBodyTextStyle,
                  hintText: hintText,
                  hintStyle: customBodyTextStyle,
                  suffixIcon: isInputNotValid
                      ? IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.warning_amber_rounded,
                            color: Colors.red,
                          ),
                        )
                      : null,
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
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onChanged: onChanged,
                validator: validator,
                // maxLines: 2,
                // minLines: 1,
                // expands: true,
              ),
            ],
          )
        : Container();
  }
}
