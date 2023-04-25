import 'package:flutter/material.dart';
import 'package:mmg_companion/utilities/widgets/base/custom_generic_container_widget.dart';

import 'package:mmg_companion/utilities/widgets/custom_text_widgets.dart';

class CustomTextContainer extends StatelessWidget {
  final String content;
  const CustomTextContainer({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return CustomGenericContainer(
      margin: true,
      child: CustomBodyText(
        content: content,
      ),
    );
  }
}
