import 'package:flutter/material.dart';
import 'package:mmg_companion/constants/colors.dart';

class CustomPageScaffold extends StatelessWidget {
  final Widget child;
  const CustomPageScaffold({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
        child: child,
      ),
    );
  }
}
