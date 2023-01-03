import 'package:flutter/material.dart';
import 'package:library_app/components/custom_bottom_nav_bar.dart';
import 'package:library_app/enums.dart';

class BookScreen extends StatelessWidget {
  static String routeName = "/book";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Book"),
      // ),
      body: Center(child: Text("book")),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.book),
    );
  }
}
