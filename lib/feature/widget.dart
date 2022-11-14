import 'package:flutter/material.dart';

showAlertDialogSingleButton(
    BuildContext context, String title, String message, bool enableBack,
    {required onPress}) {
  Widget okButton = TextButton(
    onPressed: onPress,
    child: const Text("OK"),
  );

  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(
      message,
    ),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
