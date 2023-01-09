import 'package:flutter/material.dart';

abstract class CardLayout extends StatelessWidget {
  const CardLayout({
    Key? key,
    required this.context,
    this.label,
    this.marginTop,
  }) : super(key: key);

  final BuildContext context;
  final String? label;
  final double? marginTop;

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: const Color.fromARGB(255, 231, 253, 231),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: rowContent(),
        ),
      ),
    );
  }

  List<Widget> rowContent();

  TextStyle? get cardTitleStyle => Theme.of(context).textTheme.titleMedium;
}
