import 'package:flutter/material.dart';

import 'package:mmg_companion/constants/routes.dart';
import 'package:mmg_companion/services/date_service.dart';
import 'package:mmg_companion/utilities/widgets/custom_text_widgets.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(planUsernameRoute);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeaderText(content: getWeekdayToday().toLowerCase()),
          CustomAppBarText(content: getDateToday().toLowerCase()),
        ],
      ),
    );
  }
}
