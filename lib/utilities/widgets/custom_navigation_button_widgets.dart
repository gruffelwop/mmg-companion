import 'package:flutter/material.dart';
import 'package:mmg_companion/constants/colors.dart';

class ForwardButton extends StatelessWidget {
  final Function() onTap;
  const ForwardButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        Icons.arrow_forward_ios,
        color: primaryColor,
        size: 24,
      ),
    );
  }
}

class BackwardButton extends StatelessWidget {
  final Function() onTap;
  const BackwardButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        Icons.arrow_back_ios,
        color: primaryColor,
        size: 24,
      ),
    );
  }
}
