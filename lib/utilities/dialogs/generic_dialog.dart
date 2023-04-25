import 'package:flutter/material.dart';

import 'package:mmg_companion/constants/colors.dart';
import 'package:mmg_companion/utilities/widgets/custom_text_widgets.dart';

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
        title: CustomBodyText(
          content: title,
        ),
        content: CustomBodyMultilineText(
          content: content,
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
