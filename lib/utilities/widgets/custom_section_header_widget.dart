import 'package:flutter/material.dart';

import 'package:mmg_companion/utilities/widgets/custom_margin_widget.dart';
import 'package:mmg_companion/utilities/widgets/custom_text_widgets.dart';

class CustomSectionHeader extends StatelessWidget {
  final String name;
  const CustomSectionHeader({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBodyText(content: name),
          ],
        ),
        const CustomMargin(amount: 10),
      ],
    );
  }
}
