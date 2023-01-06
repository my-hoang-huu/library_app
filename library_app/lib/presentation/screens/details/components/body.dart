import 'package:flutter/material.dart';
import 'package:library_app/presentation/components/default_button.dart';
import 'package:library_app/data/models/Book.dart';
import 'package:library_app/theme_size/size_config.dart';

import 'color_dots.dart';
import 'book_description.dart';
import 'top_rounded_container.dart';
import 'book_images.dart';

class Body extends StatelessWidget {
  final Book book;

  const Body({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BookImages(book: book),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              BookDescription(
                book: book,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    // ColorDots(book: book),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.05,
                          right: SizeConfig.screenWidth * 0.05,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: DefaultButton(
                                text: "Delete Book",
                                press: () {},
                                buttonColor: Colors.red.shade700,
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth * 0.05,
                            ),
                            Expanded(
                              child: DefaultButton(
                                text: "Update Book",
                                press: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
