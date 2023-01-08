import 'package:flutter/material.dart';
import 'package:library_app/presentation/components/book_card.dart';
import 'package:library_app/data/models/book.dart';

import '../../../../theme_size/size_config.dart';
import 'section_title.dart';

final demoBooks = List.generate(
    3,
    (index) => Book(
        id: index,
        image: "assets/images/book01.png",
        name: "name",
        price: 2,
        pageCount: 200,
        isPopular: true,
        author: "My"));

class PopularBooks extends StatelessWidget {
  const PopularBooks({super.key});

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
                  if (demoBooks[index].isPopular == true)
                    return BookCardHomePage(book: demoBooks[index]);

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
