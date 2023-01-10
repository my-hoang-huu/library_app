import 'package:flutter/material.dart';
import 'package:library_app/bloc/base_state.dart';
import 'package:library_app/const_enum/enums.dart';
import 'package:library_app/presentation/components/bottom_sheet/book_bottom_sheet.dart';
import 'package:library_app/presentation/components/bottom_sheet/bottom_sheet_layout.dart';

import '../../../data/models/book.dart';
import '../../../data/repository/base_list_repository.dart';
import '../page_layout.dart';
import 'reader_card.dart';

class ReaderScreen extends MainPageLayout {
  static String routeName = "/reader";

  const ReaderScreen({super.key});

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends MainPageLayoutState<ReaderScreen, Book, BookListRepository> {
  @override
  ListView pageContent(BuildContext context, List<Book> info) {
    return ListView.builder(
      padding: getPagePadding,
      itemCount: info.length,
      itemBuilder: (context, index) {
        return BookCard(
          context: context,
          book: info[index],
        );
      },
    );
  }

  @override
  MainMenu get getTab => MainMenu.reader;

  @override
  String get getTitle => "Reader";

  @override
  bool get hasAppbar => true;

  @override
  Color? get backgroundColor => Colors.grey.shade100;

  @override
  ModalType get screenType => ModalType.bookList;

  @override
  bool get hasBottomNavigationBar => true;

  @override
  void onCreate(BuildContext context) {
    showCustomBottomSheet(
        context: context,
        bottomSheetWidget: const BookBottomSheet(
          title: "Add reader",
          buttonTitle: "Add",
        ));
  }
}
