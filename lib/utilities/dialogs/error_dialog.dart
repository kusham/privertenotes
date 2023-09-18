import 'package:flutter/material.dart';
import 'package:privertenotes/utilities/dialogs/generic_dialog.dart';

Future<void> showErrorDialog(BuildContext context, String text) {
  return showGenericDialog(
      context: context,
      title: "An error occurred",
      contents: text,
      optionBuilder: () => {
            "OK": null,
          });
}
 