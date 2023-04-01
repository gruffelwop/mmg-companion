import 'package:flutter/material.dart';

class CustomMargin extends StatelessWidget {
  final int amount;
  const CustomMargin({
    super.key,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: amount.toDouble());
  }
}
