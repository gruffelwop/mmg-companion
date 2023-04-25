import 'package:flutter/material.dart';

import 'package:mmg_companion/constants/colors.dart';
import 'package:mmg_companion/utilities/widgets/base/custom_generic_textformfield_widget.dart';

class CustomPasswordTextFormField extends StatelessWidget {
  final String initialValue;
  final Function(String changedValue) onChanged;
  final String? Function(String? value)? validator;
  final TextInputAction textInputAction;
  final bool isPasswordVisible;
  final Function()? iconButtonOnPressed;

  const CustomPasswordTextFormField({
    super.key,
    required this.initialValue,
    required this.onChanged,
    required this.validator,
    required this.textInputAction,
    required this.isPasswordVisible,
    required this.iconButtonOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomGenericTextFormField(
      initialValue: initialValue,
      labelText: "password",
      hintText: "password",
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.disabled,
      validator: validator,
      textInputType: TextInputType.visiblePassword,
      textInputAction: textInputAction,
      obscureText: true,
      iconButton: IconButton(
        color: primaryColor,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: isPasswordVisible
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility),
        onPressed: iconButtonOnPressed,
      ),
    );
  }
}
