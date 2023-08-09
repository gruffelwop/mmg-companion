import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mmg_companion/utilities/widgets/base/custom_generic_container_widget.dart';
import 'package:mmg_companion/utilities/widgets/custom_text_widgets.dart';

class CustomGenericSwitch extends StatelessWidget {
  final bool condition;
  final bool initialValue;
  final String name;
  final bool margin;
  final bool experimental;
  final Function(bool changedValue) onChanged;

  const CustomGenericSwitch({
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
    return Column(
      children: [
        CustomGenericContainer(
          margin: margin,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomBodyText(content: name),
                  experimental == true
                      ? const CustomSmallText(content: " exp")
                      : Container(),
                ],
              ),
              SizedBox(
                height: 32,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: CupertinoSwitch(
                    thumbColor: Colors.white,
                    trackColor: Colors.red,
                    activeColor: Colors.green,
                    value: initialValue,
                    onChanged: onChanged,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
