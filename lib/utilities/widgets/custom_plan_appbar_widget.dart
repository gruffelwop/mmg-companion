import 'package:flutter/material.dart';

import 'package:mmg_companion/services/date_service.dart';
import 'package:mmg_companion/utilities/widgets/custom_text_widgets.dart';

class CustomPlanAppBar extends StatelessWidget {
  const CustomPlanAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(content: getWeekdayToday().toLowerCase()),
        CustomAppBarText(content: getDateToday().toLowerCase()),
      ],
    );
  }
}
