import 'package:flutter/material.dart';
import 'package:privertenotes/utilities/dialogs/generic_dialog.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showGenericDialog(
      context: context,
      title: "Log out",
      contents: 'Are you sure you want to log out?',
      optionBuilder: () => {
            'Cancel': false,
            'Log out': true,
          }).then((value) => value ?? false);
}
