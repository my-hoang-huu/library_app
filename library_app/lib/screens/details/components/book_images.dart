import 'package:flutter/material.dart';
import 'package:library_app/models/Book.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class BookImages extends StatefulWidget {
  const BookImages({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  _BookImagesState createState() => _BookImagesState();
}

class _BookImagesState extends State<BookImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.book.id.toString(),
              child: Image.asset(widget.book.images[selectedImage]),
            ),
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     ...List.generate(widget.book.images.length, (index) => buildSmallBookPreview(index)),
        //   ],
        // )
      ],
    );
  }

  GestureDetector buildSmallBookPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.asset(widget.book.images[index]),
      ),
    );
  }
}
