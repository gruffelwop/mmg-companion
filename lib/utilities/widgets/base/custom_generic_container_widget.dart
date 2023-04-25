import 'package:flutter/material.dart';
import 'package:mmg_companion/constants/colors.dart';

class CustomGenericContainer extends StatelessWidget {
  final bool margin;
  final Widget child;
  const CustomGenericContainer({
    super.key,
    required this.margin,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      margin: margin ? const EdgeInsets.only(bottom: 10.0) : EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: secondaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Align(
          alignment: Alignment.centerLeft,
          child: child,
        ),
      ),
    );
  }
}
