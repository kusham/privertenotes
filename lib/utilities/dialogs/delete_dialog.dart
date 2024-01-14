import 'package:flutter/material.dart';
import 'package:privertenotes/utilities/dialogs/generic_dialog.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog(
      context: context,
      title: "Delete",
      contents: 'Are you sure you want to delete this item?',
      optionBuilder: () => {
            'No': false,
            'Yes': true,
          }).then((value) => value ?? false);
}
