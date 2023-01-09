import 'package:flutter/material.dart';
import 'package:library_app/bloc/base_state.dart';
import 'package:library_app/const_enum/enums.dart';

import '../../../data/models/book.dart';
import '../../../data/repository/base_list_repository.dart';
import '../page_layout.dart';
import 'book_card.dart';

class BookScreen extends MainPageLayout {
  static String routeName = "/book";

  const BookScreen({super.key});

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends MainPageLayoutState<BookScreen, Book, BookListRepository> {
  @override
  ListView pageContent(BuildContext context, List<Book> info) {
    return ListView.builder(
      padding: getPagePadding,
      itemCount: info.length,
      itemBuilder: (context, index) {
        return BookCardLine(
          context: context,
          book: info[index],
        );
      },
    );
  }

  @override
  MainMenu get getTab => MainMenu.book;

  @override
  String get getTitle => "Book";

  @override
  bool get hasAppbar => true;

  @override
  Color? get backgroundColor => Colors.grey.shade100;

  @override
  ModalType get screenType => ModalType.book;

  @override
  bool get hasBottomNavigationBar => true;
}
