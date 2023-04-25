import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'package:mmg_companion/utilities/widgets/custom_margin_widget.dart';
import 'package:mmg_companion/utilities/widgets/base/custom_generic_appbar_widget.dart';
import 'package:mmg_companion/utilities/widgets/custom_scrollable_list_widget.dart';
import 'package:mmg_companion/views/settings/plan_settings.dart';
import 'package:mmg_companion/views/settings/push_notifications_settings.dart';
import 'package:mmg_companion/views/settings/start_page_settings.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
      ],
      child: Column(
        children: [
          CustomScrollableList(
            nonScrollableTitle: Column(children: const [
              CustomGenericAppBar(name: "settings"),
              CustomMargin(amount: 40),
            ]),
            scrollable: ListView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: const [
                StartPageSettings(),
                CustomMargin(amount: 20),
                PlanSettings(),
                CustomMargin(amount: 20),
                PushNotificationsSettings(),
                CustomMargin(amount: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Expanded(
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           CustomAppBarText(content: "plan settings"),
//         ],
//       ),
//       const CustomMargin(amount: 10),
//       Expanded(
//         child: ListView(
//           scrollDirection: Axis.vertical,
//           padding: EdgeInsets.zero,
//           shrinkWrap: true,
//           children: [],
//         ),
//       ),
//     ],
//   ),
// ),

// Expanded(
//   child: Column(
//     children: [
//       const CustomGenericAppBar(name: "settings"),
//       const CustomMargin(amount: 40),
//       Expanded(
//         child: ListView(
//           scrollDirection: Axis.vertical,
//           padding: EdgeInsets.zero,
//           shrinkWrap: true,
//           children: const [
//             StartPageSettings(),
//             CustomMargin(amount: 20),
//             PlanSettings(),
//             CustomMargin(amount: 20),
//           ],
//         ),
//       ),
//     ],
//   ),
// ),
