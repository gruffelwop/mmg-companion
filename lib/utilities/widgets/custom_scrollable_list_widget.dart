import 'package:flutter/material.dart';

class CustomScrollableList extends StatelessWidget {
  final Widget nonScrollableTitle;
  final Widget scrollable;
  const CustomScrollableList({
    super.key,
    required this.nonScrollableTitle,
    required this.scrollable,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          nonScrollableTitle,
          Expanded(child: scrollable),
        ],
      ),
    );
  }
}
