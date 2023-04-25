import 'package:flutter/material.dart';
import 'package:mmg_companion/utilities/widgets/base/custom_generic_textformfield_widget.dart';

class CustomTextTextFormField extends StatelessWidget {
  final String initialValue;
  final String labelText;
  final String hintText;
  final Function(String changedValue) onChanged;
  final AutovalidateMode autovalidateMode;
  final String? Function(String? value)? validator;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  const CustomTextTextFormField({
    super.key,
    required this.initialValue,
    required this.labelText,
    required this.hintText,
    required this.onChanged,
    required this.autovalidateMode,
    required this.validator,
    required this.textInputType,
    required this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return CustomGenericTextFormField(
      initialValue: initialValue,
      labelText: labelText,
      hintText: hintText,
      onChanged: onChanged,
      autovalidateMode: autovalidateMode,
      validator: validator,
      textInputType: textInputType,
      textInputAction: textInputAction,
      obscureText: false,
      iconButton: null,
    );
  }
}
