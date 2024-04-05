import 'package:flutter/cupertino.dart';

class MyAlertDialog {
  static void showDialog({
    required context,
    required String title,
    required String content,
    required Function() onYes,
    required Function() onNo,
  }) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              child: const Text('No'),
              onPressed: onNo,
            ),
            CupertinoDialogAction(
              child: const Text('Yes'),
              onPressed: onYes,
            ),
          ],
        );
      },
    );
  }
}
