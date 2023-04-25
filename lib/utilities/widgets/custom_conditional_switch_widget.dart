import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mmg_companion/utilities/widgets/base/custom_generic_switch_widget.dart';

class CustomConditionalSwitch extends StatelessWidget {
  final bool condition;
  final bool initialValue;
  final String name;
  final bool margin;
  final bool experimental;
  final Function(bool changedValue) onChanged;

  const CustomConditionalSwitch({
    super.key,
    required this.condition,
    required this.initialValue,
    required this.name,
    required this.margin,
    required this.experimental,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return condition
        ? CustomGenericSwitch(
            condition: condition,
            initialValue: initialValue,
            name: name,
            margin: margin,
            experimental: experimental,
            onChanged: onChanged)
        : Container();
  }
}
