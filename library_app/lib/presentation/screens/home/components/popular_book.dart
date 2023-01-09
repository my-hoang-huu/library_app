import 'package:flutter/material.dart';
import 'package:library_app/data/models/book.dart';
import 'package:library_app/presentation/components/book_popular_card.dart';

import '../../../../theme_size/size_config.dart';
import 'section_title.dart';

class PopularBooks extends StatelessWidget {
  final List<Book> bookList;

  const PopularBooks({super.key, required this.bookList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Books", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                bookList.length,
                (index) {
                  return BookPopularCard(book: bookList[index]);
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
