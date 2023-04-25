import 'package:flutter/material.dart';

import 'package:mmg_companion/constants/colors.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  const CustomScaffold({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      body: Padding(
        // padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
        // padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 10.0),
        padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
        child: child,
      ),
    );
  }
}
