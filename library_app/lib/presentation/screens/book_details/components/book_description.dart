import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:library_app/data/models/book.dart';

import '../../../../const_enum/constants.dart';
import '../../../../theme_size/size_config.dart';

class BookDescription extends StatelessWidget {
  const BookDescription({
    Key? key,
    required this.book,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Book book;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            book.name,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            book.pageCount != null
                ? Container(
                    margin: EdgeInsets.only(left: getProportionateScreenWidth(20)),
                    child: Text(
                      "${book.pageCount} pages",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: kPrimaryColor),
                    ),
                  )
                : SizedBox.shrink(),
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              width: getProportionateScreenWidth(64),
              decoration: BoxDecoration(
                color: book.isFavourite == true ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: SvgPicture.asset(
                "assets/icons/Heart Icon_2.svg",
                color: book.isFavourite == true ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
                height: getProportionateScreenWidth(16),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            book.description,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  "See More Detail",
                  style: TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
