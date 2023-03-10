import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/bloc/base_even.dart';
import 'package:library_app/bloc/base_list_bloc.dart';
import 'package:library_app/const_enum/constants.dart';
import 'package:library_app/data/models/book.dart';
import 'package:library_app/data/models/reader.dart';
import 'package:library_app/data/repository/base_list_repository.dart';
import 'package:library_app/presentation/components/bottom_sheet/bottom_sheet_layout.dart';
import 'package:library_app/presentation/components/bottom_sheet/reader_bottom_sheet.dart';
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
        textLine(reader.name, Theme.of(context).textTheme.titleLarge),
        const SizedBox(
          height: 12,
        ),
        textLine("Student code: ${reader.studentCode}", Theme.of(context).textTheme.titleSmall),
        const SizedBox(
          height: 10,
        ),
        textLine(reader.university,
            Theme.of(context).textTheme.titleLarge?.copyWith(color: kPrimaryColor))
      ],
    );
  }

  ConstrainedBox textLine(String name, TextStyle? style) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: SizeConfig.screenWidth / 2),
      child: Text(
        name,
        style: style,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
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
    showCustomBottomSheet(
        context: context,
        bottomSheetWidget: ReaderBottomSheet(
          title: "Update Reader",
          buttonTitle: "Update",
          currentReader: reader,
          onDelete: () {
            context.read<BaseListBloc<Reader, ReaderListRepository>>().add(DeletedEvent(reader.id));
            Navigator.of(context).pop();
          },
        ));
  }
}
