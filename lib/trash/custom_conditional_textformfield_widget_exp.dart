// import 'package:flutter/material.dart';
// import 'package:mmg_companion/constants/colors.dart';
// import 'package:mmg_companion/utilities/widgets/base/custom_generic_textformfield_widget.dart';

// class CustomConditionalTextFormFieldExp extends StatelessWidget {
//   final bool condition;
//   final String initialValue;
//   final String labelText;
//   final String hintText;
//   final Function(String changedValue) onChanged;
//   final AutovalidateMode autovalidateMode;
//   final String? Function(String? value)? validator;
//   final TextInputType textInputType;
//   final TextInputAction textInputAction;
//   final bool isInputWrong;
//   final Function()? iconButtonOnPressed;

//   const CustomConditionalTextFormFieldExp({
//     super.key,
//     required this.condition,
//     required this.initialValue,
//     required this.labelText,
//     required this.hintText,
//     required this.onChanged,
//     required this.autovalidateMode,
//     required this.validator,
//     required this.textInputType,
//     required this.textInputAction,
//     required this.isInputWrong,
//     required this.iconButtonOnPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return condition == true
//         ? CustomGenericTextFormField(
//             initialValue: initialValue,
//             labelText: labelText,
//             hintText: hintText,
//             onChanged: onChanged,
//             autovalidateMode: autovalidateMode,
//             validator: validator,
//             textInputType: textInputType,
//             textInputAction: textInputAction,
//             obscureText: false,
//             iconButton: isInputWrong
//                 ? IconButton(
//                     color: primaryColor,
//                     splashColor: Colors.transparent,
//                     highlightColor: Colors.transparent,
//                     icon: const Icon(Icons.warning_amber_rounded),
//                     onPressed: iconButtonOnPressed,
//                   )
//                 : null,
//           )
//         : Container();
//   }
// }
