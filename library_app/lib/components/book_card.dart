import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:library_app/models/Book.dart';
import 'package:library_app/screens/details/details_screen.dart';

import '../constants.dart';
import '../size_config.dart';

import 'package:http/http.dart' as http;

const sourceUrl = "http://10.0.2.2:5000/book-management/books";
final url = Uri.parse(sourceUrl);

Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer sfie32831542543460'
};

class BookCardHomePage extends StatelessWidget {
  const BookCardHomePage({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.book,
  }) : super(key: key);

  final double width, aspectRetio;
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: BookDetailsArguments(book: book),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: book.id.toString(),
                    child: Image.asset(book.images[0]),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                book.name,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${book.price}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () async {
                      print(["ON HEART PRESS"]);
                      final reponse = await http.get(url);
                      print(reponse.body);
                    },
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                        color: book.isFavourite
                            ? kPrimaryColor.withOpacity(0.15)
                            : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color: book.isFavourite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
