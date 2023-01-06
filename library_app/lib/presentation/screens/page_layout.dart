import 'package:flutter/material.dart';
import 'package:library_app/presentation/components/custom_bottom_nav_bar.dart';
import 'package:library_app/const_enum/enums.dart';

abstract class MainPageLayout extends StatefulWidget {
  const MainPageLayout({super.key});

  @override
  MainPageLayoutState createState();
}

abstract class MainPageLayoutState<T extends MainPageLayout> extends State<T> {
  EdgeInsets get getPagePadding => const EdgeInsets.symmetric(horizontal: 10, vertical: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Theme.of(context).canvasColor,
          centerTitle: true,
          title: Text(
            getTitle,
          ),
          automaticallyImplyLeading: false),
      body: pageContent(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: getTab),
    );
  }

  ListView pageContent();

  String get getTitle => "Book";

  MenuState get getTab => MenuState.book;
}
