import 'package:flutter/material.dart';
import 'package:mmg_companion/constants/colors.dart';

class CustomRefreshIndicator extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final bool conditon;
  final Widget child;

  const CustomRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.conditon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: primaryColor,
      backgroundColor: backgroundColor,
      child: conditon == true
          ? child
          : ListView(
              children: const [],
            ),
    );
  }
}
