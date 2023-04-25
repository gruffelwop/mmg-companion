import 'package:flutter/material.dart';

import 'package:mmg_companion/utilities/widgets/base/custom_generic_appbar_widget.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomGenericAppBar(
          name: "statistics",
        )
      ],
    );
  }
}
