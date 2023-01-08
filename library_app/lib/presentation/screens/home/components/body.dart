import 'package:flutter/material.dart';
import 'package:library_app/data/models/book.dart';
import 'package:library_app/data/models/list_book.dart';

import '../../../../theme_size/size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_book.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  final List<Book> listBook;

  const Body({super.key, required this.listBook});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            const HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            const DiscountBanner(),
            Categories(),
            const SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularBooks(bookList: listBook),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
