import 'package:flutter/material.dart';
import 'package:library_app/models/Book.dart';
import 'package:library_app/screens/book/book_card.dart';
import 'package:library_app/screens/home/components/popular_book.dart';
import 'package:library_app/screens/page_layout.dart';

List<Book> _books = demoBooks;

class BookScreen extends MainPageLayout {
  static String routeName = "/book";

  const BookScreen({super.key});

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends MainPageLayoutState<BookScreen> {
  @override
  ListView pageContent() {
    return ListView.builder(
      padding: getPagePadding,
      itemCount: _books.length,
      itemBuilder: (context, index) {
        return BookCardLine(
          context: context,
          book: _books[index],
        );
      },
    );
  }
}
