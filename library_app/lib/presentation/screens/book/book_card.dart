import 'package:flutter/material.dart';
import 'package:library_app/data/models/book.dart';
import 'package:library_app/presentation/components/card_layout.dart';
import 'package:library_app/presentation/screens/book_details/book_details_screen.dart';
import 'package:library_app/theme_size/size_config.dart';

class BookCard extends CardLayout {
  final Book book;
  const BookCard({
    super.key,
    required super.context,
    required this.book,
  });

  Column contents(BuildContext context) {
    final author = book.author;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: SizeConfig.screenWidth / 2),
          child: Text(
            book.name,
            style: Theme.of(context).textTheme.titleLarge,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        // if (author != null)
        //   Text(
        //     author,
        //     style: Theme.of(context).textTheme.titleSmall,
        //   ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: SizeConfig.screenWidth / 2),
          child: Text(
            book.description,
            style: Theme.of(context).textTheme.titleSmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }

  @override
  List<Widget> rowContent() {
    return [
      SizedBox(
        height: 80,
        child: Hero(
            tag: book.id.toString(),
            child: Image.asset(book.image, alignment: Alignment.centerLeft)),
      ),
      const SizedBox(width: 20),
      contents(context)
    ];
  }

  @override
  void onTap() {
    Navigator.pushNamed(
      context,
      BookDetailsScreen.routeName,
      arguments: BookDetailsArguments(book: book),
    );
  }
}
