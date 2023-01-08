import 'package:flutter/material.dart';

void showLoaderDialog(BuildContext context, {String? content}) {
  AlertDialog alert = AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    contentPadding: EdgeInsets.all(16),
    content: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        Container(margin: EdgeInsets.only(left: 20), child: Text(content ?? "Updating...")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
