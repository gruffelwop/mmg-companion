import 'package:flutter/material.dart';

import 'package:mmg_companion/utilities/dialogs/generic_dialog.dart';

Future<void> showInfoDialog(
  BuildContext context,
  String text,
) {
  return showGenericDialog(
    context: context,
    title: "What do I enter here?",
    content: text,
    optionsBuilder: () => {
      "Ok": null,
    },
  );
}
