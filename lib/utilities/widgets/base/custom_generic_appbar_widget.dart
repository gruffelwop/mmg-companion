import 'package:flutter/material.dart';

import 'package:mmg_companion/utilities/widgets/custom_text_widgets.dart';

class CustomGenericAppBar extends StatelessWidget {
  final String name;
  const CustomGenericAppBar({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(content: name),
      ],
    );
  }
}
