import 'package:flutter/material.dart';
import 'package:library_app/data/models/reader_modal.dart';
import 'package:library_app/presentation/components/card_layout.dart';
import 'package:library_app/theme_size/size_config.dart';

class ReaderCard extends CardLayout {
  final Reader reader;
  const ReaderCard({
    super.key,
    required super.context,
    required this.reader,
  });

  Column contents(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: SizeConfig.screenWidth / 2),
          child: Text(
            reader.name,
            style: Theme.of(context).textTheme.titleLarge,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        // if (author != null)
        //   Text(
        //     author,
        //     style: Theme.of(context).textTheme.titleSmall,
        //   ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: SizeConfig.screenWidth / 2),
          child: Text(
            reader.studentCode,
            style: Theme.of(context).textTheme.titleSmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }

  @override
  List<Widget> rowContent() {
    return [
      SizedBox(
        height: 80,
        child: Hero(
            tag: reader.id.toString(),
            child: Image.asset(reader.image, alignment: Alignment.centerLeft)),
      ),
      const SizedBox(width: 20),
      contents(context)
    ];
  }

  @override
  void onTap() {
    // Navigator.pushNamed(
    //   context,
    //   ReaderDetailsScreen.routeName,
    //   arguments: ReaderDetailsArguments(reader: reader),
    // );
  }
}
