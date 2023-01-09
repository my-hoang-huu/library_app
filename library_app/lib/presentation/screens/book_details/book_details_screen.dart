import 'package:flutter/material.dart';
import 'package:library_app/const_enum/enums.dart';
import 'package:library_app/bloc/base_state.dart';
import 'package:library_app/data/repository/base_list_repository.dart';
import 'package:library_app/presentation/screens/page_layout.dart';

import '../../../data/models/book.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class BookDetailsScreen extends MainPageLayout {
  static String routeName = "/details";

  const BookDetailsScreen({super.key});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends MainPageLayoutState<BookDetailsScreen, Book, BookListRepository> {
  late final BookDetailsArguments agrs;

  bool notInitYet = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (notInitYet) agrs = ModalRoute.of(context)!.settings.arguments as BookDetailsArguments;
    notInitYet = false;
  }

  @override
  Widget pageContent(BuildContext context, List<Book> info) {
    final book = info.firstWhere(
      (book) => book.id == agrs.book.id,
    );
    return Body(book: book);
  }

  @override
  MainMenu get getTab => MainMenu.home;

  @override
  String get getTitle => throw UnimplementedError();

  @override
  bool get hasAppbar => throw UnimplementedError();

  @override
  PreferredSizeWidget? get appBar => PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: agrs.book.rating ?? 0),
      );

  @override
  ModalType get screenType => ModalType.bookList;

  @override
  bool listenWhen(BaseState previous, BaseState current) => false;

  @override
  bool extraBuildCondition(BaseState previous, BaseState current) {
    print([current.runtimeType, "||||||||||||||||||||||||||||||||"]);
    return current is! DeleteListItemSuccessState;
  }

  @override
  bool get hasBottomNavigationBar => false;
}

class BookDetailsArguments {
  final Book book;

  BookDetailsArguments({required this.book});
}
