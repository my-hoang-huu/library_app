import 'package:flutter/material.dart';
import 'package:library_app/components/card_layout.dart';
import 'package:library_app/models/Book.dart';

class BookCardLine extends CardLayout {
  final Book book;
  const BookCardLine({
    super.key,
    required super.context,
    required this.book,
  });

  @override
  Column contents(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          book.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          book.author,
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }
}
