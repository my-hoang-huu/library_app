import 'package:flutter/material.dart';
import 'package:library_app/bloc/base_state.dart';
import 'package:library_app/const_enum/enums.dart';
import 'package:library_app/data/repository/base_list_repository.dart';
import 'package:library_app/presentation/screens/page_layout.dart';

import '../../../data/models/book.dart';
import 'components/body.dart';

class HomeScreen extends MainPageLayout {
  static String routeName = "/home";

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends MainPageLayoutState<HomeScreen, Book, BookListRepository> {
  @override
  Widget pageContent(BuildContext context, List<Book> info) {
    return Body(listBook: info);
  }

  @override
  MainMenu get getTab => MainMenu.home;

  @override
  String get getTitle => throw UnimplementedError();

  @override
  bool get hasAppbar => false;

  @override
  ModalType get screenType => ModalType.bookList;

  @override
  bool get hasBottomNavigationBar => true;
}
