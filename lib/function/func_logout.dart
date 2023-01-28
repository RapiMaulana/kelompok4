import 'package:flutter/material.dart';

logout(BuildContext context) {
  Widget buttonCancel = TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: const Text('Cancel'));
  Widget buttonOK = TextButton(
      onPressed: () => Navigator.of(context)
          .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false),
      child: const Text('OK'));

  AlertDialog logoutQuestion = AlertDialog(
    title: Text("Logout"),
    content: Text("Keluar dari aplikasi News ?"),
    actions: [buttonOK, buttonCancel],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return logoutQuestion;
      });
}
