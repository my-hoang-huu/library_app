import 'package:flutter/material.dart';
import 'package:library_app/components/card_layout.dart';

class BookCardLine extends CardLayout {
  const BookCardLine({super.key, required super.context});

  @override
  Column contents(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Title",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Author",
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }
}
