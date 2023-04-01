import 'package:flutter/material.dart';
import 'package:mmg_companion/constants/colors.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: backgroundColor,
        color: primaryColor,
      ),
    );
  }
}
