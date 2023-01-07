import 'package:flutter/material.dart';
import 'package:library_app/presentation/components/card_layout.dart';
import 'package:library_app/data/models/book.dart';

class BookCardLine extends CardLayout {
  final Book book;
  const BookCardLine({
    super.key,
    required super.context,
    required this.book,
  });

  @override
  Column contents(BuildContext context) {
    final author = book.author;
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
        if (author != null)
          Text(
            author,
            style: Theme.of(context).textTheme.titleSmall,
          )
      ],
    );
  }
}
