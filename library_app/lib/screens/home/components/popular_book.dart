import 'package:flutter/material.dart';
import 'package:library_app/components/book_card.dart';
import 'package:library_app/models/Book.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularBooks extends StatelessWidget {
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
                demoBooks.length,
                (index) {
                  if (demoBooks[index].isPopular) return BookCard(book: demoBooks[index]);

                  return SizedBox.shrink(); // here by default width and height is 0
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
