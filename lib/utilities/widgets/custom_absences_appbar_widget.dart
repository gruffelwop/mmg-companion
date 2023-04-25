import 'package:flutter/material.dart';

import 'package:mmg_companion/services/date_service.dart';
import 'package:mmg_companion/utilities/widgets/custom_text_widgets.dart';

class CustomAbsencesAppBar extends StatelessWidget {
  const CustomAbsencesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomHeaderText(content: "absences"),
        CustomAppBarText(content: getDateToday().toLowerCase()),
      ],
    );
  }
}
