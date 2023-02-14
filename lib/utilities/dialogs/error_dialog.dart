

import 'package:flutter/material.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text
) {
  return showGeneralDialog(context: context, pageBuilder: pageBuilder)
}