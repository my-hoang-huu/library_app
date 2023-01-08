import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  final String message;
  const SuccessDialog({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 24, bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.check_circle,
              size: 30,
              color: Colors.green,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              message,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.green),
            ),
            const SizedBox(
              height: 8,
            ),
            TextButton(
              child: Text(
                'Close',
                style:
                    Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
