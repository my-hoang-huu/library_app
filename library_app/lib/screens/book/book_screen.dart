import 'package:flutter/material.dart';
import 'package:library_app/screens/book/book_card.dart';
import 'package:library_app/screens/page_layout.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      itemCount: 14,
      itemBuilder: (context, index) {
        return BookCardLine(
          context: context,
        );
      },
    );
  }
}
