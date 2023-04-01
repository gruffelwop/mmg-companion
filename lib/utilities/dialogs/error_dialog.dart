import 'package:flutter/material.dart';
import 'package:mmg_companion/utilities/dialogs/generic_dialog.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) {
  return showGenericDialog(
    context: context,
    title: "An error occurred.",
    content: text,
    optionsBuilder: () => {
      "Ok": null,
    },
  );
}
