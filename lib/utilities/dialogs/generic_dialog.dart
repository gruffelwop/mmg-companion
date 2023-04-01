import 'package:flutter/material.dart';
import 'package:mmg_companion/constants/colors.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<T?> showGenericDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  required DialogOptionBuilder optionsBuilder,
}) {
  final options = optionsBuilder();
  return showDialog<T>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          style: TextStyle(
            color: primaryColor,
          ),
        ),
        content: Text(
          content,
          style: TextStyle(color: primaryColor),
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        actions: options.keys.map(
          (optionTitle) {
            final T value = options[optionTitle];
            return TextButton(
              onPressed: () {
                if (value != null) {
                  Navigator.of(context).pop(value);
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                optionTitle,
                style: TextStyle(color: primaryColor),
              ),
            );
          },
        ).toList(),
      );
    },
  );
}
