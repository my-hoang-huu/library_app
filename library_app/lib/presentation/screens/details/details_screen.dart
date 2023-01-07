import 'package:flutter/material.dart';

import '../../../data/models/book.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final BookDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as BookDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: agrs.book.rating ?? 0),
      ),
      body: Body(book: agrs.book),
    );
  }
}

class BookDetailsArguments {
  final Book book;

  BookDetailsArguments({required this.book});
}
